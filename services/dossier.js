exports.updateStatusDossier = (dossier) => {
  let jsonFile = JSON.parse(dossier);
  let status = 1;
  jsonFile.forEach((element) => {
    if (element.etat == 0) {
      status = 0;
    }
  });
  return status;
};
