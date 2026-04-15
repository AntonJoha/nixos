{
  lib,
  buildPythonPackage,
  decorator,
  fetchFromGitHub,
  imageio,
  imageio-ffmpeg,
  matplotlib,
  numpy,
  proglog,
  pytestCheckHook,
  pythonOlder,
  requests,
  scikit-image,
  scikit-learn,
  scipy,
  setuptools,
  tqdm,
  yt-dlp,
}:

buildPythonPackage rec {
  pname = "moviepy";
  version = "1.0.3";
  pyproject = true;

  disabled = pythonOlder "3.7";

    src = fetchFromGitHub {
    owner = "Zulko";
    repo = pname;
    rev = "b5bb086439cfd0960011a065f229eb7a7b4ebad5";
    sha256 = "sha256-Y+rehn+fLR0id5jAmfOkYHj8mLMJgnMwld7wp5BxmuQ=";
  };
  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "decorator>=4.0.2,<5.0" "decorator>=4.0.2,<6.0"
  '';

  build-system = [ setuptools ];

  dependencies = [
    decorator
    imageio
    imageio-ffmpeg
    numpy
    proglog
    requests
    tqdm
  ];

  passthru.optional-dependencies = {
    optionals = [
      matplotlib
      scikit-image
      scikit-learn
      scipy
      yt-dlp
    ];
  };

  nativeCheckInputs = [
    pytestCheckHook
  ] ++ lib.flatten (builtins.attrValues passthru.optional-dependencies);

  pythonImportsCheck = [ "moviepy" ];

  disabledTests = [
    "test_cuts1"
    "test_issue"
    "test_PR"
    "test_setup"
    "test_subtitles"
    "test_sys_write_flush"
  ];

  disabledTestPaths = [
    "tests/test_compositing.py"
    "tests/test_fx.py"
    "tests/test_ImageSequenceClip.py"
    "tests/test_resourcerelease.py"
    "tests/test_resourcereleasedemo.py"
    "tests/test_TextClip.py"
    "tests/test_VideoClip.py"
    "tests/test_Videos.py"
    "tests/test_videotools.py"
  ];

  meta = with lib; {
    description = "Video editing with Python";
    homepage = "https://zulko.github.io/moviepy/";
    changelog = "https://github.com/Zulko/moviepy/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
