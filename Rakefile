$: << File.dirname(__FILE__)

ROOT_DIR = File.dirname(__FILE__).freeze
SPECS_DIR = File.join(ROOT_DIR, 'specs').freeze


file "#{ROOT_DIR}/.node_updated" => "#{ROOT_DIR}/package.json" do
  cd ROOT_DIR do
    sh "npm install"
    sh "touch .node_updated"
  end
end

namespace :service do
  desc "Run the specs to test multiple scenarios for booking"
  task :spec => ["#{ROOT_DIR}/.node_updated"] do
    cd ROOT_DIR do
      sh "node_modules/jasmine-node/bin/jasmine-node --coffee #{SPECS_DIR}"
    end
  end
end


