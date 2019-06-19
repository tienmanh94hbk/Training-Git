let B=[1,2,3,9,10];
let A=[];
let x;
let n;
for(let i=0;i<B.length;i++){
    n=B[i];
    fibonaci(n);
    A[i]=x;
}
function fibonaci(n) {
    if(n===0){
        return x=0;
    }
    else if(n<=2){
        return x=1;
    }else {
        x= fibonaci(n-1)+fibonaci(n-2);
        return x;
    }
}
console.log(A);