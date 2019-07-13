function getFileInputs() {
  const inputs: NodeListOf<HTMLInputElement> = document.querySelectorAll('input[type="file"]');
  return inputs;
}

function updateLabelFilename(input: HTMLInputElement) {
  if (input.files.length > 0) {
    const parent = input.parentNode;
    const nameSpan = parent.querySelector('span.file-name');
    if (nameSpan !== null) {
      const names = Array.from(input.files).map(f => f.name);
      nameSpan.textContent = names.join(', ');
    }
  }
}

function hookFileInputs() {
  const inputs = getFileInputs();
  inputs.forEach(input => {
    input.onchange = () => {
      updateLabelFilename(input);
    }
  });
}

document.addEventListener('turbolinks:load', hookFileInputs, false);
