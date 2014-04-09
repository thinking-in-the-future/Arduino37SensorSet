int a=6; 

int b=5; 

int c=9; 

int d=10; 

int e=11; 

int f=7; 

int g=8; 

int dp=4; 

int waitTimer=1000; 

  

void init_wire(){ 

   int j; 

   for(j=4;j<=11;j++) 

    digitalWrite(j,HIGH); 

} 

  

// 显示数字 0 

void digital_0(void) 

{ 

  init_wire(); 

  digitalWrite(a,LOW); 

  digitalWrite(b,LOW); 

  digitalWrite(c,LOW); 

  digitalWrite(d,LOW); 

  digitalWrite(e,LOW); 

  digitalWrite(f,LOW); 

} 

  

// 显示数字 1 

void digital_1(void) 

{ 

  init_wire(); 

  digitalWrite(c,LOW);// 给数字 5 引脚低电平 ， 点亮 c 段 

  digitalWrite(b,LOW);// 点亮 b 段 

} 

// 显示数字 2 

void digital_2(void) 

{ 

  init_wire(); 

  digitalWrite(b,LOW); 

  digitalWrite(a,LOW); 

  digitalWrite(g,LOW); 

  digitalWrite(e,LOW); 

  digitalWrite(d,LOW); 

} 

// 显示数字 3 

void digital_3(void) 

{ 

  init_wire(); 

  digitalWrite(b,LOW); 

  digitalWrite(a,LOW); 

  digitalWrite(g,LOW); 

  digitalWrite(c,LOW); 

  digitalWrite(d,LOW); 

} 

// 显示数字 4 

void digital_4(void) 

{ 

  init_wire(); 

  digitalWrite(f,LOW); 

  digitalWrite(g,LOW); 

  digitalWrite(b,LOW); 

  digitalWrite(c,LOW); 

} 

// 显示数字 5 

void digital_5(void) 

{ 

  init_wire(); 

  digitalWrite(a,LOW); 

  digitalWrite(f,LOW); 

  digitalWrite(g,LOW); 

  digitalWrite(c,LOW); 

  digitalWrite(d,LOW); 

} 

// 显示数字 6 

void digital_6(void) 

{ 

  init_wire(); 

  digitalWrite(a,LOW);   

  digitalWrite(f,LOW); 

  digitalWrite(e,LOW); 

  digitalWrite(g,LOW); 

  digitalWrite(c,LOW); 

  digitalWrite(d,LOW); 

} 

// 显示数字 7 

void digital_7(void) 

{ 

  init_wire(); 

  digitalWrite(a,LOW); 

  digitalWrite(b,LOW); 

  digitalWrite(c,LOW); 

} 

  

// 显示数字 8 

void digital_8(void) 

{ 

  init_wire(); 

  int i; 

  for(i=5;i<=11;i++) 

    digitalWrite(i,LOW); 

} 

  

// 显示数字 9 

void digital_9(void) 

{ 

  init_wire(); 

  digitalWrite(a,LOW); 

  digitalWrite(b,LOW); 

  digitalWrite(f,LOW); 

  digitalWrite(g,LOW); 

  digitalWrite(c,LOW); 

  digitalWrite(d,LOW); 

} 

  

// 显示数字 p 

void digital_p(void) 

{ 

  init_wire(); 

  digitalWrite(dp,LOW); 

} 

  

void setup() 

{ 

  int i;// 定义变量 

  for(i=4;i<=11;i++) 

    pinMode(i,OUTPUT);// 设置 4 ～ 11 引脚为输出模式 

} 

void loop() 

{  

  setup(); 

  while(1) 

  { 

    digital_1();// 数字 1 

    delay(waitTimer);// 延时 2s 

    digital_2(); 

    delay(waitTimer); 

    digital_3(); 

    delay(waitTimer); 

    digital_4(); 

    delay(waitTimer); 

    digital_5(); 

    delay(waitTimer); 

    digital_6(); 

    delay(waitTimer); 

    digital_7(); 

    delay(waitTimer); 

    digital_8(); 

    delay(waitTimer); 

    digital_9(); 

    delay(waitTimer); 

    digital_0(); 

    delay(waitTimer); 

    digital_p(); 

    delay(waitTimer); 

  } 

} 


