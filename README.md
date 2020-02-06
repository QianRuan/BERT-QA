## 1.Local setup
### create annaconda envrioment
<br>conda create -n tfptpy37 python=3.7
<br>source activate tfptpy37
### install required packages
<br>conda install -y pytorch torchvision cudatoolkit=10.0 -c pytorch
<br>conda install -y tensorflow-gpu==2.0
<br>conda install -y -c conda-forge tensorboard
<br>conda install -y -c conda-forge transformers
<br>conda install -y -c anaconda pandas==0.25.3
<br>conda install -y -c anaconda git
<br>conda install -y -c conda-forge git-bash 
### clone this project
<br>git clone https://gitlab.tubit.tu-berlin.de/QU-Projects-ML-NLP-WS-2019-20/BERT-QA.git
### make sure that you are in the project folder
<br>cd BERT-QA
<br>git clone https://github.com/huggingface/transformers
<br>cd transformers
<br>pip install .
<br>pip install -r ./examples/requirements.txt
<br>cd ..
### download the squad 2.0 datasets
<br>mkdir squadData
<br>cd squadData
<br>curl -O https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v2.0.json
<br>curl -O https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v2.0.json
<br>cd ..
### create output folder
<br>mkdir squadOutput
### NOW: you can start training!
<br>bash squad-train-bert1.sh

## 2.Docker image
<br>docker pull ruanqian/bertqa
<br>docker run --name bertqaContainer -d ruanqian/bertqa
<br>docker exec -it bertqaContainer /bin/bash
<br>cd BERT-QA
### NOW: you can start training!
<br>bash squad-train-bert1.sh
