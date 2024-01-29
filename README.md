# Intelligent Separation and Filtering of Ambient Sounds Based on Recordable Vital Signs
Noise varies among individuals, it is not a specific frequency or type of sound. Furthermore, the perception of noise differs with changes in an individual's mood. Recently, no matter active or passive noise reduction products on the market, it is difficult to intelligently identify, separate and screen out the noise under the current mood. In order to intelligently distinguish and filter noise, this study proposes an intelligent separation and filtering system architecture to remove unwanted ambient sounds based on recordable physiological signals, including blind source separation using FastICA to recover source signals from their mixtures; Mel-frequency cepstrum coefficients for feature extraction from audio signals; autoencoder for compression of feature vector from a high dimensional space to a lower dimensional space; spectral clustering to decide how many clusters are formed in the datasets of audio signals and vital signs that represent different moods; Gaussian mixture model with the algorithm of expectation-maximization for clustering; and a probability-based optimal matching for linking potential relationship between sounds and moods. The system matches the most suitable mood according to the current vital signs, so as to select the most suitable sound for the user.

# System Architecture Design
<img width="1133" alt="image" src="https://github.com/JYOU0925/INTELLIGENT-SEPARATION-OF-AMBIENT-SOUNDS/assets/116496533/2599cb5c-e92b-491a-bc93-e1a23e725290">

## The workflow of the training phase
<img width="790" alt="image" src="https://github.com/JYOU0925/INTELLIGENT-SEPARATION-OF-AMBIENT-SOUNDS/assets/116496533/c5fc8118-432d-4540-b68a-e07d78b52094">

## The workflow of the operation phase
<img width="1174" alt="image" src="https://github.com/JYOU0925/INTELLIGENT-SEPARATION-OF-AMBIENT-SOUNDS/assets/116496533/4586066d-fcc4-482e-87a4-677f07c18e9a">

## The workflow of the intelligent cluster mapping
<img width="779" alt="image" src="https://github.com/JYOU0925/INTELLIGENT-SEPARATION-OF-AMBIENT-SOUNDS/assets/116496533/a44d4ac2-4f1f-43f5-ab3d-febf54d75166">




