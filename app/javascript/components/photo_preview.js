const previewImageOnFileSelect = (photoInputID, photoPreviewID) => {
  // we select the photo input
  const input = document.getElementById(photoInputID);
  if (!input) return;

  // we add a listener to know when a new picture is uploaded
  input.addEventListener('change', () => {
    // we call the displayPreview function (who retrieve the image url and display it)
    displayPreview(input, photoPreviewID);
  });
}


const displayPreview = (input, photoPreviewID) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById(photoPreviewID).src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById(photoPreviewID).classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };
