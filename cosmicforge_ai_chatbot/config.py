import os

class Config:
    BASE_DIR = os.environ.get('BASE_DIR', '/app/cosmicforge_ai_chatbot')
    MODEL_DIR = "FlameGreat01/Medical_Diagnosis_System"  
    DATA_DIR = os.path.join(BASE_DIR, 'data')
    LOG_DIR = os.environ.get('LOG_DIR', '/tmp/logs')  
    LOG_FILE = os.path.join(LOG_DIR, 'cosmicforge_chatbot.log')
    MODEL_VERSION = '1.0'
    HF_TOKEN = os.environ.get('HF_TOKEN')

    # FastAPI specific configurations
    API_HOST = os.environ.get('API_HOST', '0.0.0.0')
    API_PORT = int(os.environ.get('API_PORT', 7860))
    
    LOG_LEVEL = os.environ.get('LOG_LEVEL', 'INFO')
    LOG_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'

    @classmethod
    def is_production(cls):
        return os.environ.get('ENVIRONMENT', 'development').lower() == 'production'

    @classmethod
    def create_directories(cls):
        for directory in [cls.DATA_DIR, cls.LOG_DIR]:
            os.makedirs(directory, exist_ok=True)
