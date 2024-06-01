from flask import Flask, request, jsonify


class WebServer:
    def __init__(self, pipeline_processor, file_processor):
        self.app = Flask(__name__)
        self.add_routes()
        self.pipelineProcessor = pipeline_processor
        self.fileProcessor = file_processor

    def add_routes(self):
        @self.app.route('/prescription', methods=['GET'])
        def get_prescription():
            try:
                response = self.pipelineProcessor.processInput("")
                return jsonify({'message': 'GET request received', 'data': response})
            except Exception as e:
                print(f"An error has occurred: {e}")
                return jsonify({'message': 'An Internal error has occurred'}), 500

        @self.app.route('/prescription', methods=['POST'])
        def get_prescriptions():
            # Handle POST request
            data = request.json
            first_med = data['meds'][0]
            print(first_med)
            prescription_text = self.fileProcessor.extract_section_by_name(first_med)
            print(prescription_text)
            print("\n")
            try:
                response = self.pipelineProcessor.processInput(prescription_text)
                processed_prescription = self.pipelineProcessor.process_data(data['age'], response)
                return jsonify({'med': first_med, 'text': prescription_text, 'data': response, 'prescriptie': processed_prescription})
            except Exception as e:
                print(f"An error has occurred: {e}")
                return jsonify({'message': 'An Internal error has occurred'}), 500

        @self.app.route('/resource', methods=['PUT'])
        def update_resource():
            # Handle PUT request
            data = request.json
            return jsonify({'message': 'PUT request received', 'data': data})

        @self.app.route('/resource', methods=['DELETE'])
        def delete_resource():
            # Handle DELETE request
            return jsonify({'message': 'DELETE request received'})

    def run(self, host='127.0.0.1', port=5000):
        self.app.run(host=host, port=port)
