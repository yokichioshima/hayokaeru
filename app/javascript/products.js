/* 食材画像クリックイベント発火動作定義 */
const inputMaterialByClickingImage = (materials, pickMaterials, guidTextOptions) => {
    materials.forEach(function(material) {
        material.addEventListener('click', function(){
            const materialName = material.querySelector(".material-name");
            const materialId = material.querySelector(".material-id");
            const materialQuantityUnit = material.querySelector(".material-quantity-unit");
            const inputNameBox = document.getElementById(`${materialName.innerHTML}`);
            const inputForm = document.getElementById(`${materialId.innerHTML}`);
            if ( inputNameBox != null || inputForm != null ) {
                inputNameBox.remove();
                inputForm.remove();
            } else {
                const htmlPickMaterialNames = `
                <div class="material-name-box" id="${materialName.innerHTML}">
                ${materialName.innerHTML}<input name="[single_quantities][]" class="input-quantity-form" 
                id="quantity-${materialId.innerHTML}" ><div class="material-quantity-unit-on-form">${materialQuantityUnit.innerHTML}</div>
                </div>`;
                const htmlPickMaterialIds = `
                <input name="product[material_ids][]" type="hidden" class="input-form" id="${materialId.innerHTML}" value=${materialId.innerHTML} > `;  
                pickMaterials.insertAdjacentHTML("beforeend", htmlPickMaterialNames);
                guidTextOptions.insertAdjacentHTML("beforebegin", htmlPickMaterialIds);
            };
        });
    });
};
/* 食材画像クリックイベント発火動作定義 */

/* サイドバー料理名、id入力欄の入れ替え */
// const swapStringPlaces = (nameBoxes, inputForms) =>  {
//   let boxId;
//   let formId;
//   nameBoxes.forEach(function(box) {
//     box.addEventListener('mousedown', () => {
//       boxId = box.id;
//       formId = inputForms[box.id.replace(/[^0-9]/g, '') - 1].id;
//     });

//     box.addEventListener('mouseup', () => {
//       if (boxId != "") {
//         const formerBox = document.getElementById(boxId);
//         const formerBoxInnerHTML = formerBox.innerHTML;
//         const formerForm = document.getElementById(formId);
//         const formerFormValue = formerForm.value;
//         formerBox.innerHTML = box.innerHTML;
//         formerForm.value = inputForms[box.id.replace(/[^0-9]/g, '') - 1].value;
//         box.innerHTML = formerBoxInnerHTML;
//         inputForms[box.id.replace(/[^0-9]/g, '') - 1].value = formerFormValue;
//       } else {
//         return false;
//       };
//     });
//   });
// };
/* サイドバー料理名、id入力欄の入れ替え */

function readyForGettingMaterialIds (){
    /* 入力情報元の要素取得 */
    const materials = document.querySelectorAll(".material");
    /* 入力情報元の要素取得 */

    /* 食材名表示BOX取得 */
    const pickMaterials = document.getElementById("pick-materials");
    /* 食材名表示BOX取得 */

    const guidTextOptions = document.getElementById("guid-text-options");

    inputMaterialByClickingImage(materials, pickMaterials, guidTextOptions);
};
  
window.addEventListener('load', readyForGettingMaterialIds);