let n;
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
console.log(fibonaci(n));