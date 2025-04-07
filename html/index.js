shopOpen = false;
resourceName = null;
firstCategory = null;
cData = [];
totalBasketPrice = 0;
totalBasketPriceJob = 0;
folder = null;
window.addEventListener('message', function(event) {
    ed = event.data;
    if (ed.action === "openShop") {
        resourceName = ed.resourceName;
        folder = ed.folder;
        shopOpen = true;
        if (ed.type === "normal") {
            document.getElementById("body").style.display = "block";
            document.getElementById("box").style.display = "block";
            document.getElementById("bg").style.display = "block";
            document.getElementById("job-market").style.display = "none";
            document.getElementById("header").innerHTML=ed.name;
            document.getElementById("alt").innerHTML=ed.label;
            document.getElementById("category").innerHTML="";
            document.getElementById("item-box").innerHTML="";
            document.getElementById("cart-box").innerHTML="";
            totalBasketPrice = 0;
            document.getElementById("total-price").innerHTML="$" + totalBasketPrice;
            ed.categories.forEach(function(data, index) {
                if (firstCategory === null) {
                    firstCategory = data.name;
                }
                cData[data.name] = data.items;
                var categoriesHTML = `
                <div id="MDMarkerDiv" onclick="clFunc('shopItems', '${data.name}')">
                    <div id="MDMDLeftSide">
                        <div class="MDMDLDDiv1"></div>
                        <div class="MDMDLDDiv2">
                            <i style="transform: rotate(-135deg); font-size: 10px;" class="fad fa-building"></i>
                        </div>
                        <div class="categoryname">${data.name}</div>
                        <div class="categorydesc">${data.description}</div>
                        <div class="MDMDLDDiv3">
                        </div>
                    </div>
                </div>`;
                appendHtml(document.getElementById("category"), categoriesHTML);
                clFunc('shopItems', firstCategory)
            });
        } else if (ed.type === "job") {
            document.getElementById("body").style.display = "block";
            document.getElementById("job-market").style.display = "block";
            document.getElementById("job-cart-box").innerHTML;
            totalBasketPriceJob = 0;
            document.getElementById("job-cart-price").innerHTML="$" + totalBasketPriceJob;
            let label = ed.label;
            if (label.length > 7) {
                label = label.slice(0, 7) + ".";
            }
            let slicedLabel = label.split(' ');
            if (slicedLabel.length >= 2) {
                document.getElementById("job-header").innerHTML=`${slicedLabel[0]} <span style="font-family: AkrobatExtraLight;">${slicedLabel[1]}</span>`;
            } else {
                document.getElementById("job-header").innerHTML=label;
            }
            // document.getElementById("job-header").innerHTML=label;
            $(".job-box,.job-cart-circle").animate({
                top: "0px"
            }, 500);
            document.getElementById("scrollBox").innerHTML="";
            ed.categories.forEach(function(data, index) {
                if (firstCategory === null) {
                    firstCategory = data.name;
                }
                cData[data.name] = data.items;
                var categoriesHTML = `
                <div class="job-category-item" onclick="clFunc('shopItemsJob', '${data.name}')">
                    <div class="job-category-name">${data.name}</div>
                    <div class="job-itemalt"></div>
                </div>`;
                appendHtml(document.getElementById("scrollBox"), categoriesHTML);
                clFunc('shopItemsJob', firstCategory)
            });
        }
	} else if (ed.action === "updateBasket") {
        document.getElementById("cart-box").innerHTML = "";
        totalBasketPrice = 0;
        if (document.querySelectorAll(".cart-item").length === 0) {
            totalBasketPrice = 0;
            document.getElementById("total-price").innerHTML = "$0";
            console.log("Keranjang masih kosong setelah updateBasket, reset total harga lagi.");
        } else {
            document.getElementById("total-price").innerHTML = "$" + totalBasketPrice;
        }
        console.log("Reset totalBasketPrice ke 0 di updateBasket");
        ed.basket.forEach(function(data, index) {
            totalBasketPrice = totalBasketPrice + data.totalPrice;
            document.getElementById("total-price").innerHTML="$" + totalBasketPrice;
            var basketHTML = `
            <div class="cart-item">
                <div class="cart-img">
                <img src="${folder}${data.name}.png" alt="">
                </div>
                <div class="cart-name">${data.label}</div>
                <div class="cart-price">$${data.totalPrice}</div>
                <div class="cart-count">x${data.amount}</div>  
                <div class="eksi-box" onclick="clFunc('removeOneBasket', '${data.name}')">
                    <div class="ex">-</div>
                </div>
                <div class="arti-box" onclick="clFunc('addBasketMore', '${data.name}')">
                    <div class="arti">+</div>
                </div>
                <div class="delete-box" onclick="clFunc('deleteItemFromBasket', '${data.name}')">
                    <div class="delete">
                    <i class="fas fa-trash-alt"></i>
                    </div>
                </div>
            </div>`;
            appendHtml(document.getElementById("cart-box"), basketHTML);
        });
    } else if (ed.action === "updateBasketJob") {
        const jobCartBox = document.getElementById("job-cart-box");
        const jobCartPrice = document.getElementById("job-cart-price");
    
        jobCartBox.innerHTML = "";
        totalBasketPriceJob = 0;
        jobCartPrice.innerHTML = "$0"; // reset dulu harganya
    
        if (Array.isArray(ed.basket) && ed.basket.length > 0) {
            ed.basket.forEach(function(data) {
                if (!data || typeof data.totalPrice !== "number") return;
    
                totalBasketPriceJob += data.totalPrice;
                jobCartPrice.innerHTML = "$" + totalBasketPriceJob;
    
                const basketHTML = `
                <div class="job-cart-item">
                    <div class="cart-img">
                        <img src="${folder}${data.name}.png" alt="">
                    </div>
                    <div class="cart-name">${data.label}</div>
                    <div class="cart-price">$${data.totalPrice}</div>
                    <div class="cart-count">x${data.amount}</div>  
                    <div class="eksi-box" onclick="clFunc('removeOneBasketJob', '${data.name}')">
                        <div class="ex">-</div>
                    </div>
                    <div class="arti-box" onclick="clFunc('addBasketMoreJob', '${data.name}')">
                        <div class="arti">+</div>
                    </div>
                    <div class="delete-box" onclick="clFunc('deleteItemFromBasketJob', '${data.name}')">
                        <div class="delete">
                            <i class="fas fa-trash-alt"></i>
                        </div>
                    </div>
                </div>`;
                
                appendHtml(jobCartBox, basketHTML);
            });
        }
    }    
    document.onkeyup = function(data) {
		if (data.which == 27 && shopOpen) {
            shopOpen = false;
            cData = [];
            firstCategory = null;
            document.getElementById("body").style.display = "none";
            document.getElementById("box").style.display = "none";
            // document.getElementById("bg").style.display = "none";
            document.getElementById("job-market").style.display = "none";
            document.getElementById("job-cart-box").innerHTML="";
            document.getElementById("cart-box").innerHTML="";
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${resourceName}/close`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({}));
		}
	}
})

function clFunc(name1, name2, name3, name4, name5) {
    if (name1 === "shopItems") {
        document.getElementById("item-box").innerHTML="";
        cData[name2].forEach(function(data, index) {
            var itemsHTML = `
            <div class="item">
                <img class="icon" src="../images/miniicon.png" alt="">
                <div class="dollarbox"></div>
                <i class="fa-solid fa-dollar-sign dollaricon"></i>
                <div class="itemoney">${data.perPrice}</div>
                <div class="moneybox"></div>
                <img class="img" src="${folder}${data.name}.png" alt="">
                <div class="itemalt">
                    <div class="item-name">${data.label}</div>
                    <div class="item-altcategory">${data.description}</div>
                    <div class="cartbox" onclick="clFunc('addBasket', '${data.name}', '${data.perPrice}', '${data.label}', '${data.requiredLicense}')">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                </div>
                <hr class="itemalthr">
            </div>`;
            appendHtml(document.getElementById("item-box"), itemsHTML);
        });
    } else if (name1 === "shopItemsJob") {
        document.getElementById("jobscroll").innerHTML="";
        cData[name2].forEach(function(data, index) {
            var itemsHTML = `
            <div class="job-item">
                <img class="job-icon" src="../images/miniicon.png" alt="">
                <div class="job-dollarbox"></div>
                <i class="fa-solid fa-dollar-sign job-dollaricon"></i>
                <div class="job-itemoney">${data.perPrice}</div>
                <div class="job-moneybox"></div>
                <img class="job-img" src="${folder}${data.name}.png" alt="">
                <div class="job-itemaltt">
                    <div class="job-item-name">${data.label}</div>
                    <div class="job-item-altcategory">${data.description}</div>
                    <div class="job-cartbox" onclick="clFunc('addBasketJob', '${data.name}', '${data.perPrice}', '${data.label}')">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                </div>
                <hr class="job-itemalthr">
            </div>`;
            appendHtml(document.getElementById("jobscroll"), itemsHTML);
        });
    } else if (name1 === "addBasket") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/addToBasket`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2, price: name3, label: name4, license: name5}));
    } else if (name1 === "addBasketJob") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/addBasketJob`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2, price: name3, label: name4}));
    } else if (name1 === "addBasketMore") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/addBasketMore`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2}));
    } else if (name1 === "addBasketMoreJob") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/addBasketMoreJob`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2}));
    } else if (name1 === "removeOneBasket") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/removeOneBasket`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2}));
    } else if (name1 === "removeOneBasketJob") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/removeOneBasketJob`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2}));
    } else if (name1 === "deleteItemFromBasket") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/deleteItemFromBasket`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2}));
    
        // Paksa reset harga kalau keranjang kosong
        setTimeout(() => {
            if (document.querySelectorAll(".cart-item").length === 0) {
                totalBasketPrice = 0;
                document.getElementById("total-price").innerHTML = "$0";
                console.log("Total harga direset ke $0 dengan delay untuk memastikan UI update.");
            }
        }, 200); // Delay sedikit untuk memastikan DOM sudah update
    } else if (name1 === "deleteItemFromBasketJob") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/deleteItemFromBasketJob`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({name: name2}));
    } else if (name1 === "makePayment") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/makePayment`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({type: name2, price: totalBasketPrice}));
        shopOpen = false;
        document.getElementById("body").style.display = "none";
        document.getElementById("box").style.display = "none";
        // document.getElementById("bg").style.display = "none";
        document.getElementById("job-market").style.display = "none";
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/close`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({}));
    } else if (name1 === "makePaymentJob") {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/makePaymentJob`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({type: name2, price: totalBasketPriceJob}));
        shopOpen = false;
        document.getElementById("body").style.display = "none";
        document.getElementById("box").style.display = "none";
        // document.getElementById("bg").style.display = "none";
        document.getElementById("job-market").style.display = "none";
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `https://${resourceName}/close`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({}));
    }
}

function appendHtml(el, str) {
	var div = document.createElement('div');
	div.innerHTML = str;
	while (div.children.length > 0) {
		el.appendChild(div.children[0]);
	}
}
