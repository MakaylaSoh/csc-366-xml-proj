
SELECT 
  COUNT(ExtractValue(xml_doc, 'count(/store)')) as StoreCount
FROM xml_store;