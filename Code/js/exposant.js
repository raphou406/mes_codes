function PI_quart(n){
    let pi=0;
    for(let i=0;i<n;i++){
        pi+=(((-1)**i)/(2*i+1));
    }
    return pi;
}
console.log(4*PI_quart(100000));

function factoriel(n){
    let res=1;
    for(let i=1;i<=n;i++){
        res*=i;
    }
    return res;
}
console.log(factoriel(5));
function expo(n){
    let e=0;
    for(let i=0;i<=n;i++){
        e=e+(1/factoriel(i));
    }
    console.log(e);
}
expo(170);

function PI_demi(n){
    let pi=1;
    for(let i=1;i<=n;i++){
        pi*=((2*i)**2)/((2*i)**2-1)
    }
    return pi
}
console.log(2*PI_demi(100000))