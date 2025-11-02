import h5py
import numpy as np
from gwkokab.utils.train import train_regressor

data = np.random.normal(size=(10_000, 5))
target = np.sum(data, axis=1, keepdims=True)


input_keys = ["x" + str(i) for i in range(5)]
output_keys = ["y"]

data_path = "data.hdf5"
with h5py.File(data_path, "w") as f:
    f.create_dataset("x0", data=data[:, 0])
    f.create_dataset("x1", data=data[:, 1])
    f.create_dataset("x2", data=data[:, 2])
    f.create_dataset("x3", data=data[:, 3])
    f.create_dataset("x4", data=data[:, 4])
    f.create_dataset("y", data=target)

checkpoint_path = "model_checkpoint.hdf5"

train_regressor(
    input_keys=input_keys,
    output_keys=output_keys,
    width_size=32,
    depth=2,
    batch_size=64,
    data_path=data_path,
    checkpoint_path=checkpoint_path,
    epochs=500,
    validation_split=0.2,  # 20% of data used for validation
    learning_rate=1e-3,
)
