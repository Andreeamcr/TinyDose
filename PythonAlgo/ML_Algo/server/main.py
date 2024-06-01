from web_server import WebServer
from pipeline_processor import PipelineProcessor
from file_processor import FileProcessor

if __name__ == '__main__':
    fileProcessor = FileProcessor()
    pipelineProcessor = PipelineProcessor()
    server = WebServer(pipelineProcessor, fileProcessor)
    server.run(host='0.0.0.0', port=8000)
