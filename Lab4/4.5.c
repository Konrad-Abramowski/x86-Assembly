#include <stdio.h>
#include <unistd.h>

unsigned long long time();

int main(){

  unsigned long long time1, time2;
  float a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u,w,y,z,aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,kk,ll,mm = 2.1;

  time1 = time();
  for(int counter=0;i<100;i++){
    a = b + c;
    d = a * e; 
    f = d + g;
    h = f * i;
    j = h + k;
    l = j * m; 
    n = l + o;
    p = n * r; 
    s = p + t;
    u = s * w; 
    y = u + z;
    aa = y * bb;
  }   
  time2 = time();
  printf("CPU cycles: %llu\n", time2-time1 );
  
  a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u,w,y,z = 2.1;

  time1 = time();
  for(int counter=0;i<100;i++){
    a = b + c;
    d = e * f;
    g = h + i;
    j = k * l;
    m = n + o;
    p = r * s; 
    t = u + w;
    y = z * aa; 
    bb = cc + dd;
    ee = ff * gg; 
    hh = ii + jj;
    kk = ll * mm;   
  } 
  time2 = time();
  printf("CPU cycles: %llu\n", time2-time1 );
}
