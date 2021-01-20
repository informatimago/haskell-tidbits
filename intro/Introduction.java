class Introduction {
  public static void main(String[] args) {
    final int LIMIT=50;
    int[] a=new int[LIMIT];
    int[] b=new int[LIMIT-5];
    for(int i=0;i<LIMIT;i++){
      a[i]=(i+1)*2;
      if(i>=5){
        b[i-5]=a[i];}}

    System.out.print("a = {");
    for(int i=0;i<LIMIT;i++){
      System.out.print(a[i]);
      System.out.print(", ");}
    System.out.println("};");

    System.out.print("b = {");
    for(int i=0;i<LIMIT-5;i++){
      System.out.print(b[i]);
      System.out.print(", ");}
    System.out.println("};");

  }
}
