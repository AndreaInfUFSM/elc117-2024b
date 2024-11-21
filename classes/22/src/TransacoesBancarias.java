class Conta {

  private float saldo = 0f;

  public Conta(float inicial) {
    saldo = inicial;
  }

  public float getSaldo() {
    return saldo;
  }

  public void deposita(float valor) {
    saldo += valor;
  }

  public void retira(float valor) {
    saldo -= valor;
  }

}




class Transacoes implements Runnable {

  private Conta c;
  private int n;
  private int valor_credito;
  private int valor_debito;

  public Transacoes(Conta c, int n, int valor_credito, int valor_debito) {
    this.c = c;
    this.n = n;
    this.valor_credito = valor_credito;
    this.valor_debito = valor_debito;
  }

  @Override
  public void run() {
    for (int i = 0; i < n; i++) {
      c.deposita(valor_credito);
      c.retira(valor_debito);
    }
  }
}

class TestTransacoesBancarias {

  public static void main(String[] args) {
  
    Conta c = new Conta(0);
    // 1000 depósitos de 10 e 1000 retiradas de 5 = 5000
    Runnable transacoes = new Transacoes(c, 1000, 10, 5);
    
    // Cria 2 objetos da classe Thread
    Thread thread1 = new Thread(transacoes); // 5000
    Thread thread2 = new Thread(transacoes); // 5000

    // Ativa execução das threads
    thread1.start();
    thread2.start();

    // Aguarda término das threads
    try {
      thread1.join();
      thread2.join();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }

    // Saldo deveria ser 10000
    System.out.println("Saldo final: " + c.getSaldo());
  }
}

