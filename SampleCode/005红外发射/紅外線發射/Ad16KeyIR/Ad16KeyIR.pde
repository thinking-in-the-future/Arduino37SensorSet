const int analogInPin = A0;  //設定類比輸入
int sensorValue = 0;         
int KEY ;
int NEWKEY ;
int OLDKEY = 0;
int OK = 0 ; 
int FLAG = 0;
int coun = 0;
int coun1 = 0;
int look = 0;

int chk[16] = {0,100,260,385,482,530,587,630,660,688,714,735,753,769,784,800};// 設定陣列比較值

//*******************************************************************************************
#include <IRremote.h>   
long irKeyCodes[16] = {
   0x00000000, 0x40BFF807, 0x40BF7887, 0xC03FC03F,       // 對應 Keypad 的 '1', '2', '3','4'
  0xC03F40BF,0x40BF00FF, 0x00000000, 0x00000000,       // 對應 Keypad 的 '5', '6', '7','8'
  0x00000000, 0x00000000, 0x00000000, 0x00000000,       // 對應 Keypad 的 '9', '10', '11,'12'
  0x80FFC13E, 0x80FFE11E, 0x80FFD12E, 0x80FFF10E        // 對應 Keypad 的 '13', '14', '15','16
};
IRsend irsend;
//*******************************************************************************************

void setup() {
  Serial.begin(9600); //設定胞率
}

 void loop() {

    sensorValue = analogRead(analogInPin);                        
   delay(15);
   aaa:    
     if (FLAG == 0)
      {
  if (chk[0]<=sensorValue && sensorValue<chk[1])        //陣列比較
     {
      KEY = 1 ; 
     }
   else if (chk[1]<=sensorValue && sensorValue<chk[2])  //陣列比較
     {
      KEY = 2 ;   
     }
   else if (chk[2]<=sensorValue && sensorValue<chk[3])   //陣列比較
     {
      KEY = 3 ;        
     }
   else if (chk[3]<=sensorValue && sensorValue<chk[4])    //陣列比較
     {
      KEY = 4 ;       
     }
   else if (chk[4]<=sensorValue && sensorValue<chk[5])    //陣列比較
     {
      KEY = 5 ;    
     }
   else if (chk[5]<=sensorValue && sensorValue<chk[6])    //陣列比較
     {
      KEY = 6 ;
     }
   else if (chk[6]<=sensorValue && sensorValue<chk[7])     //陣列比較
     {
      KEY = 7 ; 
     }
   else if (chk[7]<=sensorValue && sensorValue<chk[8])      //陣列比較
     {
      KEY = 8 ;  
     }
   else if (chk[8]<=sensorValue && sensorValue<chk[9])     //陣列比較
     {
     KEY = 9 ;    
     }
   else if (chk[9]<=sensorValue && sensorValue<chk[10])      //陣列比較
     {
      KEY = 10 ; 
     }
   else if (chk[10]<=sensorValue && sensorValue<chk[11])     //陣列比較
     {
      KEY = 11 ;
     }
   else if (chk[11]<=sensorValue && sensorValue<chk[12])     //陣列比較
     {
      KEY = 12 ;  
     }
   else if (chk[12]<=sensorValue && sensorValue<chk[13])     //陣列比較
     {
      KEY = 13 ; 
     }
   else if (chk[13]<=sensorValue && sensorValue<chk[14])     //陣列比較
     {
      KEY = 14 ; 
     }
   else if (chk[14]<=sensorValue && sensorValue<chk[15])     //陣列比較
     {
      KEY = 15 ;   
     }
   else if (chk[15]<sensorValue && sensorValue<850)          //陣列比較
     {
      KEY = 16 ;  
     }
   else if (sensorValue>1000 )                               //陣列比較
     {
      KEY =  0;   
     }     
    }
     
     
    NEWKEY = KEY;                  //將 KEY值 放入 NEWKEY                   
      if ( NEWKEY == OLDKEY)       // 如果 NEWKEY = = OLDKEY 則 OK + 1       
         {                                                                                                                                               
           OK++;                                                                 
         }                                                    
         else
         {
           OK = 0;                 // 如果不是  OK變為0         
         }
         OLDKEY = NEWKEY;
      if(OK>=5)                     // 如果 OK =5  將設定值 列印出來
           {
           Serial.print("KEY = ");    
           Serial.println(NEWKEY);
            Serial.println(sensorValue);
              Serial.print("look = ");    
           Serial.println(look);   
         if (NEWKEY !=0)
         {  
           switch(NEWKEY){

       case 1:
            FLAG =1;
             break;
       case 2:
             FLAG =1;
             break;
       case 3:
             FLAG =1;
             break;
       case 4:
               FLAG =1;
              break;
       case 5:
           FLAG =1;
              break;
       case 6:
              FLAG =1;
                break;
       case 7:
               FLAG =1;
                break;
       case 8:
               FLAG =1;
               break;
       case 9:
               FLAG =1;
               break;
       case 10:
               FLAG =1;
               break;
       case 11:
               FLAG =1;
               break;
        case 12: 
               FLAG =1;
               break;
        case 13:    
               FLAG =1;
               break;
        case 14:  
                FLAG =1;
                 break;
        case 15:
                FLAG =1;
                break;

        case 16:            
              FLAG =1;
              break;               
            }     
         }    
         
          if(NEWKEY>0)
                {            
                  coun1++;            
                }  
                
             if(coun1>5)
                {
                  coun1=0;
                  irsend.sendNEC(irKeyCodes[NEWKEY], 32);
                  look++;
                }  
         
          if (sensorValue>950)
          {
            coun++;
          }
          if(coun>1)
          { 
             FLAG =0;      
            coun = 0;
            goto aaa;
         }
    }
 }



