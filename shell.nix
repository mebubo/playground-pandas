{ pkgs ? import <nixpkgs> {} }:

let

    python-with-packages = pkgs.python3.withPackages (p: [
        p.pandas
        p.wordfreq
        p.spacy
        p.jupyterlab
        p.vega_datasets
    ]);

    run-jupyter = pkgs.writeShellScriptBin "run-jupyter" ''
        jupyter notebook --no-browser
    '';

in

    pkgs.mkShell {
        packages = [
            pkgs.jupyter
            run-jupyter
            python-with-packages
        ];
    }
