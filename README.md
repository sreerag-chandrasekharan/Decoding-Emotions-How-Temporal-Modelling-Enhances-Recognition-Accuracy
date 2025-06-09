# Decoding Emotions: How Temporal Modelling Enhances Recognition Accuracy

Master Thesis - Biomedical Engineering  
Sreerag Chandrasekharan  

---

## Summary

Developed a **Facial Emotion Recognition (FER) system** that combines **pre-trained CNN models** (ResNet50, GoogleNet, AlexNet) with **LSTM** networks to capture **temporal patterns** in facial expressions.

This approach enhances recognition accuracy and robustness for potential real-time applications — particularly to support individuals with **Autism Spectrum Disorder (ASD)**.

Using the **Oulu-CASIA facial expression database**, my optimized pipeline achieved **up to 96.4% accuracy**, showing the strong benefits of integrating temporal modeling with deep learning for FER.

---

## Methods

The model pipeline includes:

- **Preprocessing**:
  - Face detection using Haar Cascade and LBP.
  - Image resizing based on CNN input needs.
  - Data augmentation with Salt & Pepper noise and brightness enhancement.
  
- **Model Architecture**:
  - **Model 1**: CNNs — ResNet50, GoogleNet, AlexNet.
  - **Model 2**: CNN feature extraction + LSTM layers with 64–250 units.

- **Training**:
  - Optimizers: Adam (Model 1), SGDM (Model 2).
  - Dataset split: 70% training, 30% validation.
  - Epochs: 40, Batch size: 50, Learning rate: 0.0001.

---

## Results

### Model 1 (CNN only)

| Model    | Max Accuracy |
|----------|--------------|
| ResNet50 | 84.48%       |
| GoogleNet| 87.50%       |
| AlexNet  | 86.13%       |

### Model 2 (CNN + LSTM)

| Model + LSTM | Max Accuracy |
|--------------|--------------|
| ResNet50 + LSTM | **96.40%** |
| GoogleNet + LSTM| 94.21%     |
| AlexNet + LSTM  | 94.06%     |

Adding LSTM layers consistently improved performance across all models. **ResNet50 + LSTM** yielded the best accuracy.

---

## Tags

`Facial-Emotion-Recognition` `Deep-Learning` `LSTM` `CNN` `Autism-Spectrum-Disorder` `Image-Classification` `Temporal-Modeling` `Machine-Learning` `Biomedical-Engineering` `Master-Thesis`

---
