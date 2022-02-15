/* 食材画像クリックイベント発火動作定義 */
const inputMaterialByClickingImage = (materials, pickMaterials) => {
  materials.forEach(function(material) {
    material.addEventListener('click', function(){
      const materialName = material.querySelector(".material-name");
      const materialId = material.querySelector(".material-id");
      const htmlPickMaterialNames = `
        <div id="${materialName.innerHTML}">
          ${materialName.innerHTML}
        </div>`;
      const htmlPickMaterialIds = `
        <input name="[material_ids][]" type="hidden" class="input-form" id="${materialId.innerHTML}" value=${materialId.innerHTML} > 
        `;  
      pickMaterials.insertAdjacentHTML("beforeend", htmlPickMaterialNames);
      pickMaterials.insertAdjacentHTML("afterend", htmlPickMaterialIds);
    });
  });
};
/* 食材画像クリックイベント発火動作定義 */

function readyForGettingMaterialIds (){
  /* 入力情報元の要素取得 */
  const materials = document.querySelectorAll(".material");
  /* 入力情報元の要素取得 */

  /* 食材名表示BOX取得 */
  const pickMaterials = document.getElementById("pick-materials");
  /* 食材名表示BOX取得 */

  inputMaterialByClickingImage(materials, pickMaterials);
};
  
window.addEventListener('load', readyForGettingMaterialIds);