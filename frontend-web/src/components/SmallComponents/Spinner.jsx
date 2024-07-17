import React from 'react';
import Lottie from 'react-lottie';
import animationData from 'src/styles/loading';
import 'src/styles/style.css';
const defaultOptions = {
  loop: true,
  autoplay: true,
  animationData: animationData,
  rendererSettings: {
    preserveAspectRatio: "xMidYMid slice",
  },
};

const Spinner = () => {
  return (
    <div className='spinner'>
      <Lottie options={defaultOptions} height={400} width={400} isClickToPauseDisabled={true} />
    </div>
  );
};

export default Spinner;
