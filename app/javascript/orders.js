/* 料理画像クリックイベント発火動作定義 */
const inputProductByClickingImage = (products, nameBoxes, inputForms) => {
    products.forEach(function(product) {
        product.addEventListener('click', () => {
            for (let i = 0; i < 5; i++) {
                if (nameBoxes[i].innerHTML == product.querySelector(".product-name").innerHTML || 
                    inputForms[i].value == product.querySelector(".product-id").innerHTML) {
                        nameBoxes[i].innerHTML = "";
                        inputForms[i].value = "";
                        return false;
                    };
            };
            for (let i = 0; i < 5; i++) {
                if (nameBoxes[i].innerHTML == "" && inputForms[i].value == "" ) {
                    nameBoxes[i].innerHTML = product.querySelector(".product-name").innerHTML;
                    inputForms[i].value = product.querySelector(".product-id").innerHTML;
                    return false;
                };
            };
        });
    });
};
/* 料理画像クリックイベント発火動作定義 */

/* サイドバー料理名,id入力欄の入れ替え */
const swapStringPlaces = (nameBoxes, inputForms) =>  {
    let boxId;
    let formId;
    nameBoxes.forEach(function(box) {

        box.addEventListener('mousedown', () => {
            boxId = box.id;
            formId = inputForms[box.id.replace(/[^0-9]/g, '') - 1].id;
        });

        box.addEventListener('mouseup', () => {
            if (boxId != "") {
                const formerBox = document.getElementById(boxId);
                const formerBoxInnerHTML = formerBox.innerHTML;
                const formerForm = document.getElementById(formId);
                const formerFormValue = formerForm.value;
                formerBox.innerHTML = box.innerHTML;
                formerForm.value = inputForms[box.id.replace(/[^0-9]/g, '') - 1].value;
                box.innerHTML = formerBoxInnerHTML;
                inputForms[box.id.replace(/[^0-9]/g, '') - 1].value = formerFormValue;
            } else {
                return false;
            };
        });
    });
};
/* サイドバー料理名、id入力欄の入れ替え */

function readyForGettingProductIds () {
    /* 入力情報元の要素取得 */
    const products = document.querySelectorAll(".product");
    /* 入力情報元の要素取得 */

    /* 料理idを入力するフォーム、料理名表示BOX取得 */
    const nameBoxIds = ["product-1-name", "product-2-name", "product-3-name", 
                            "product-4-name", "product-5-name"];
    const inputFormIds = ["input-product-1", "input-product-2", "input-product-3",
                              "input-product-4", "input-product-5"];
    let nameBoxes = [];
    let inputForms = [];
    for (let i = 0; i < 5; i++) {
        nameBoxes[i]= document.getElementById(nameBoxIds[i]);
        inputForms[i] = document.getElementById(inputFormIds[i]);
    };
    /* 料理idを入力するフォーム、料理名表示BOX取得 */

    inputProductByClickingImage(products, nameBoxes, inputForms);
    swapStringPlaces(nameBoxes, inputForms);
};

window.addEventListener("load", readyForGettingProductIds);