document.getElementById('year').textContent = new Date().getFullYear();
document.getElementById('shopNow').addEventListener('click', ()=> {
  alert('Welcome to Hijab Shop — demo!');
});

// demo products
const products = [
  {id:1, name:'Classic Hijab', price:'$12'},
  {id:2, name:'Sport Hijab', price:'$18'},
  {id:3, name:'Silk Hijab', price:'$25'},
];
const container = document.getElementById('products');
products.forEach(p=>{
  const el = document.createElement('div');
  el.className='card';
  el.innerHTML = `<h3>${p.name}</h3><p>${p.price}</p><button>Buy</button>`;
  container.appendChild(el);
});
