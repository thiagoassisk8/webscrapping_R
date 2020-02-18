const puppeteer = require('puppeteer');

async function run(){
    const browser = await puppeteer.launch({headless:false})
    const page = await browser.newPage()
    await page.goto('https://www.ibge.gov.br/estatisticas/economicas/servicos/9229-pesquisa-mensal-de-servicos.html?=&t=resultados');
    await new Promise(resolve => setTimeout(resolve, 2500));  
    await page.select("select#seriehistorica2017105103132839export", "csv")
    await page.waitFor(3000)
    //await page._client.send('Page.setDownloadBehavior', {behavior: 'allow', downloadPath: '/home/me/stuff'});
    await browser.close();
}
run()