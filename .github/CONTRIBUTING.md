# コントリビューションガイド

## DockerfileのTips
- 最後に`ENTRYPOINT ["/main.py"]`で実行すると、以下のエラーが出るため、`RUN chmod +x main.py`で直前に権限を与える必要がある  
  「docker: Error response from daemon: failed to create task for container: failed to create shim task: OCI runtime create failed:runc create failed: unable to start container process: exec: "/main.py": permission denied: unknown.」
