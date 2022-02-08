function getMaterialIds (){
  const materialElements = document.querySelectorAll(".material");
  const pickMaterials = document.getElementById("pick-materials");
  

  materialElements.forEach(function(list) {
    list.addEventListener('click', function(){
      const materialId = list.querySelector("#material-id");
      const materialName = list.querySelector(".material-name");
      const htmlPickMaterialNames = `
        <b id="${materialName.innerHTML}">
          ${materialName.innerHTML}
      </b>`;
      const htmlPickMaterialIds = `
        <input name="[material_ids][]" type="hidden" class="input-form" id="${materialId.innerHTML}" value=${materialId.innerHTML} > 
      `;  
      pickMaterials.insertAdjacentHTML("beforeend", htmlPickMaterialNames);
      pickMaterials.insertAdjacentHTML("afterend", htmlPickMaterialIds);
    });
  });
};

window.addEventListener('load', getMaterialIds);