Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020109.outbound.protection.outlook.com [52.101.229.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013E37204C;
	Fri, 17 Jul 2026 05:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264613; cv=fail; b=QPdlLQoCPkq4x8wUq9uenCCvOWUs1ZaWWPKePkGWmLtwXc/hyRU3kRUcnot8YpqrNTuNpoicbH4DLluE2tFOe00ILBfqHlr/QZBDu7rd3yYMuy7Uaiz9Ix0DgBAPb930foiDTAnRSVnqDEWdEPx5g8baj+5aC5XqvY4JkfLChoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264613; c=relaxed/simple;
	bh=LSDP5nIMXfsw7cKotI0TGgGAyo1oCGrLmKcfVzjbeXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=svTVAHKU+YefPL7VWk/OzCBi44wbRoUSq6mY3P9qnJT2Qa73QvR1WP2j/0xXNvZro9gmEcdCLTV6/LOZhC7RYRG7XSA0M3vlOCof5rwlXV08A0zJPkKWc6gSde6nw4kobyvWWojM5MqWFFbZ1CAQ5Mg3tJ9plrwgPZVWGBs5mBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=D2VU1cY2; arc=fail smtp.client-ip=52.101.229.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="D2VU1cY2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLuEHk7wXrIajPa3w2uImzvJXxRvW5tPzz4mW8/tkYGgzGxkgKYbg8HTqpf4YTRkNaRvaqmWSp3I1PYumz3VNdjFC4MaFfUBEXQEY0vUbhe0w+S9KNs9qkACJKGmxnyIWTPZN3+LK04iySa+cxpqZHAuQ0QvZ3Ufd/aEygF0ZGpf6uMDExqy75eiLLWrcBaVdC9Ht7FHvqMqZHPeF1N5j1kYpxpjjUSMgKECNUSvAAiBjmXygeFYYqBxhyhxylf8R5bHYLiDDjw4WSVbtlJaY2aUfJDPFCdna7N3cnGa6xvAXeO0Rnw1/WwzrhMSgOiOO0pkxhpyfZdNluV18yYe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlNqYHzjSSY1MkHV/uKYRiIu3YetaMkK08Ibm8OHTG8=;
 b=UTvpto0mQMSGJwpbn1o3Kqv628twFDG7NOgEsxbQYS+JMQR6BJPhMjFxnPkaCyB4TGcwJqKI9bICH8MUazfuWImTxyK5xinDFPmZf5Qmy2spphhLwC1YJHCz4qtLZH7pDctk/IQ1JU5DVpJbJrxUAeT/irSPJ72P3xMH5DUzbWJ+IsT7HwqKfYDkqUPVEc7tvgfHhSvovfz1F2MVv7HSvdeXQnu49eJPJc+SI98A4iLHMvzS3UfBHCOZrzMaTjWeHG4+IQyFYoPQlcxwL6fOO2SjIPDheTFhACR6Bw1DZ3SO6TlJnrkK1/pJTHs/KwtY+tZ+ozLB4eyevCM5eorg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlNqYHzjSSY1MkHV/uKYRiIu3YetaMkK08Ibm8OHTG8=;
 b=D2VU1cY2R8nFmPeEGn49SnYJUcnFD11a5tGyBQSqOqHqhgI1Wi2PuMmMl4Y/6fdtNaq2HMEy0GNq0PfCMJMunyEr6nsFphsEm6vsTNsWACdiFVyLQdII2s1SK3EOcD2aeVobvHrMO+1f5qNRUggny2qBFE2ZgWEZ2sl54Dgqx1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/14] dmaengine: dw-edma-pcie: Rename vsec_data to dma_data
Date: Fri, 17 Jul 2026 14:03:02 +0900
Message-ID: <20260717050308.2144108-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f2bda6-dd7b-4a0c-8566-08dee3c0b971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ERW4qds9vu9ZiU7daKbXaE/NhSQFoOqMU40wzhtV9ehLRklPKwGUuz66Pdi+Pb5ZRfRqObI92fJU2ArBYnvlAJYW0K7tqGBKGDoh2G1QvRA2pi4glZ0XjWp09g37sUMieBGwaybrWNAfHClHBNaE+vmzMrfXGdjdd4eJTJbpliRGdGhOkmT6aUsJwFAJt0gWHDiRr1sxmzKjWpuq5hjYKdFGN2Niw21jNpD3bat8XGySlOFl4YW4kENBayMzjYSmTR58XGiO9t2uGrRpK05wH0jzKqEiQnhjxFzvAEDhPNICGKhBDnh95Q/IcJHzAdXKlCpmWVxh/duTh9FUuCOr1iFd+4F6gnepE+9TL5lK+d7lUXyEOjZPIDNbEeiKGRZqWGxBVAva0nXNGyvcO64g9r62xu5PfMFLnPSblyPvilvlXhfGSoGmMIw09+i/05+RskKTAcvzFoPRPBkl1TuW2BIlgGP0cZWGKZ38zagd8gW6Nr87xRcRyzVpOkquecMPqzi0EPpPxTGYapAklvcoV+5+4jy36v+67d4UVOKB9g1DG3MgDUn1DAbSccWQYf/Z47E9mufm29a1xd8UuZEkvDAfGyncDRp7e71hym5/nwAA2Guf/eG41CG7/cAWCuujzboCzeBCKII6SGqzBkkmaqlvMzKrWWjMFNhYQ/za/QE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGjoTqc9kACFcwFdrbQE94QgybF65kgQSFUmkRTAJt3a2+2RgfzocpPJ9Ia0?=
 =?us-ascii?Q?2Uei0wiT1YX/PHIqdMtRX5f1qxPHkrD6JWYnin6F+IkD4PgHuXiPMt+S0YCC?=
 =?us-ascii?Q?tggfm5dJf18njJqVwg/ETjCq6IDRuFca8kUKs9jFPDaVLp4MTuxHPblntnTt?=
 =?us-ascii?Q?qg99C8EXEwQL2cK9Pz0Khi0tBfQq+2PdHdOeHlA9J36ADRycR5KKn6n59k4Q?=
 =?us-ascii?Q?XawNDtBNtv80vPSHw7ZU6hdBvBJUGw+LOm/5Zd42Le3CImWLfwWwBReV4x4c?=
 =?us-ascii?Q?L0qSFnuy7UnTaVwWagzhVzCTQJ44s5N88Q4mg4gBsmCqIv9f82qy9JgoVPxM?=
 =?us-ascii?Q?gR1qsxu/9exZn3zbCntjZGEtO85pGlddlXZruQyzpV7hgbxD4PgEBqSECvjP?=
 =?us-ascii?Q?84/5QYhDscAOkwPUHH0EJppf2DrJjBA8tyx4kB5dWXiK62MA1GcP+X45eA77?=
 =?us-ascii?Q?AUc5XLX1ZUR57lyaID1lY+lXVGElyXffO44qvC+mXuFKqoRj3gJ83BFlO23p?=
 =?us-ascii?Q?cZDJS8gkF3Kch15LNl+LeyzVqve6Dk3r0NbgKqNvLD+/abFJdKf7Xs9DjjHP?=
 =?us-ascii?Q?31Fj+UJOn7O5eBS8XZy+MXGQKAda0og6012js7sKL2+bSXcjvWX3nIzbEN3E?=
 =?us-ascii?Q?mu49lxxQlA/D82a9T5cMxeRoRPVput/6V12lV4UEPUpOobcXO7wmsAMqGEK6?=
 =?us-ascii?Q?r6roMYGarUhy3BvKcTZp8YZuJBmLicqLfK/kc6j20HToL5RLzCIUglTWNbra?=
 =?us-ascii?Q?nDwkZSYeaO9v3IsriMtBA+VNj5M8zpp7Ej0InHMla3CsWj2GdsgzdCR4TeXD?=
 =?us-ascii?Q?p+MzWPtGWLc2IBWQRtPHIZU3qb+aRtXDx5wsxHNCVd45+Bw8DEW7nPMiFy04?=
 =?us-ascii?Q?7uo3XxEIgwX6ZjZEt7xiYLi4cpZ/aXMGG4KlIA47qjy+hBFLZKoIfq+veKHn?=
 =?us-ascii?Q?+G/kK/ZoaLjaKW933m2qTqNKAFGKSyeJvx6DNxF878hdlvGNyzKshOtQn4EF?=
 =?us-ascii?Q?ThUoxnsaETFgtslg669crCIhQN705j2iiE/sOPicZJnOQ8UgcQq1NpDZni2v?=
 =?us-ascii?Q?oQ5aJGFmtYO9NDwVYGBmTjmsaSgDckzf+Qso8WNhh6Ci1o6yPZA/nWvjkcBH?=
 =?us-ascii?Q?tG+aMiVKhLKPWVXLat8ST3wnG5+onPjHEnrbhJGhuse1UP1i456JkxoHOJqS?=
 =?us-ascii?Q?FsKczhd3UgdouMNp4a+iyIYECq6lPanbX4MZLh1VZI4aF3QgZAetBwSWvvkh?=
 =?us-ascii?Q?scLSnxa3jGpmLXHmXAkAZRBQpdCU9GrIiiE/nH4AsG1VmBhUGQuQY8cZTVyl?=
 =?us-ascii?Q?kIiV/SwkiHYCGFAvOzkZNXp7xHfVRCzuugDk8Lz1XnNFpufr20HRY0ayrln6?=
 =?us-ascii?Q?ap00yXxbE9EECsfnvzZg4xsZHb2DijoBXEhBSz9fVbK6D/TuWi67uo8IxFpu?=
 =?us-ascii?Q?ySw7spqmjW8kx040j2hti/ntvmevuLF3ZfvPIhE00SZchAqAG1KbjadmnRqO?=
 =?us-ascii?Q?nvMMp55OP+pYUJF6Qw+df1Kg0kr7DpMCD55ONuqQr64UxbR8d5Lf1LMuhSFJ?=
 =?us-ascii?Q?7Esm2Drnvgmiy8XUUWvOb3sakWmqH+pFXg9d3+8Q3n1m3jCZgmGHzbm3JRMt?=
 =?us-ascii?Q?S68y/eDW7KUU0BBdnGGMffolLko6MEYNTNxZjxBOMT8u9lFMj4TXc7Nn68nX?=
 =?us-ascii?Q?COiQIaLA6Z5Zt4hgrQmDt2Eoe3hKRtUvqZmHW+7Z3v0rs/SKZNeLwX7zhxTR?=
 =?us-ascii?Q?BHa+JU5C4zk4Ly9iDb06UNINIvq/gIyN/g0kDdceCoDR6QQZWm+m?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f2bda6-dd7b-4a0c-8566-08dee3c0b971
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:21.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlL1gmeso7dZtkaBYK02oxQwahpWfobnk+EV4UhbokLoW7NHEHj4QFlc4bAG+V7Yk670adtJlDdzyU9PeCse/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

dw_edma_pcie_probe() now obtains DMA layout data through device-specific
capability callbacks, not only from PCIe Vendor-Specific Extended
Capabilities. Rename the local data copy from vsec_data to dma_data
before adding endpoint DMA BAR metadata discovery, which does not rely
on VSEC.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 74 +++++++++++++++---------------
 1 file changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 23f09ee89639..46f16d7b6d51 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -390,9 +390,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	if (!pdata)
 		return -ENODEV;
 
-	struct dw_edma_pcie_data *vsec_data __free(kfree) =
-		kmalloc_obj(*vsec_data);
-	if (!vsec_data)
+	struct dw_edma_pcie_data *dma_data __free(kfree) =
+		kmemdup(pdata, sizeof(*dma_data), GFP_KERNEL);
+	if (!dma_data)
 		return -ENOMEM;
 
 	/* Enable PCI device */
@@ -402,25 +402,23 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		return err;
 	}
 
-	memcpy(vsec_data, pdata, sizeof(struct dw_edma_pcie_data));
-
 	/* Let device-specific discovery override the static template data. */
 	if (!match->parse_caps)
 		return -EINVAL;
 
-	err = match->parse_caps(pdev, vsec_data);
+	err = match->parse_caps(pdev, dma_data);
 	if (err)
 		return err;
 
 	/* Mapping PCI BAR regions */
-	mask = BIT(vsec_data->rg.bar);
-	for (i = 0; i < vsec_data->wr_ch_cnt; i++) {
-		mask |= BIT(vsec_data->ll_wr[i].bar);
-		mask |= BIT(vsec_data->dt_wr[i].bar);
+	mask = BIT(dma_data->rg.bar);
+	for (i = 0; i < dma_data->wr_ch_cnt; i++) {
+		mask |= BIT(dma_data->ll_wr[i].bar);
+		mask |= BIT(dma_data->dt_wr[i].bar);
 	}
-	for (i = 0; i < vsec_data->rd_ch_cnt; i++) {
-		mask |= BIT(vsec_data->ll_rd[i].bar);
-		mask |= BIT(vsec_data->dt_rd[i].bar);
+	for (i = 0; i < dma_data->rd_ch_cnt; i++) {
+		mask |= BIT(dma_data->ll_rd[i].bar);
+		mask |= BIT(dma_data->dt_rd[i].bar);
 	}
 	err = pcim_iomap_regions(pdev, mask, pci_name(pdev));
 	if (err) {
@@ -443,7 +441,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	/* IRQs allocation */
-	nr_irqs = pci_alloc_irq_vectors(pdev, 1, vsec_data->irqs,
+	nr_irqs = pci_alloc_irq_vectors(pdev, 1, dma_data->irqs,
 					PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (nr_irqs < 1) {
 		pci_err(pdev, "fail to alloc IRQ vector (number of IRQs=%u)\n",
@@ -454,23 +452,23 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	/* Data structure initialization */
 	chip->dev = dev;
 
-	chip->mf = vsec_data->mf;
+	chip->mf = dma_data->mf;
 	chip->nr_irqs = nr_irqs;
 	chip->ops = &dw_edma_pcie_plat_ops;
-	chip->cfg_non_ll = vsec_data->cfg_non_ll;
+	chip->cfg_non_ll = dma_data->cfg_non_ll;
 
-	chip->ll_wr_cnt = vsec_data->wr_ch_cnt;
-	chip->ll_rd_cnt = vsec_data->rd_ch_cnt;
+	chip->ll_wr_cnt = dma_data->wr_ch_cnt;
+	chip->ll_rd_cnt = dma_data->rd_ch_cnt;
 
-	chip->reg_base = pcim_iomap_table(pdev)[vsec_data->rg.bar];
+	chip->reg_base = pcim_iomap_table(pdev)[dma_data->rg.bar];
 	if (!chip->reg_base)
 		return -ENOMEM;
 
-	for (i = 0; i < chip->ll_wr_cnt && !vsec_data->cfg_non_ll; i++) {
+	for (i = 0; i < chip->ll_wr_cnt && !dma_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_wr[i];
 		struct dw_edma_region *dt_region = &chip->dt_region_wr[i];
-		struct dw_edma_block *ll_block = &vsec_data->ll_wr[i];
-		struct dw_edma_block *dt_block = &vsec_data->dt_wr[i];
+		struct dw_edma_block *ll_block = &dma_data->ll_wr[i];
+		struct dw_edma_block *dt_block = &dma_data->dt_wr[i];
 
 		ll_region->vaddr.io = pcim_iomap_table(pdev)[ll_block->bar];
 		if (!ll_region->vaddr.io)
@@ -478,7 +476,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		ll_region->vaddr.io += ll_block->off;
 		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, ll_block->bar);
+							 dma_data, ll_block->bar);
 		ll_region->paddr += ll_block->off;
 		ll_region->sz = ll_block->sz;
 
@@ -488,16 +486,16 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		dt_region->vaddr.io += dt_block->off;
 		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, dt_block->bar);
+							 dma_data, dt_block->bar);
 		dt_region->paddr += dt_block->off;
 		dt_region->sz = dt_block->sz;
 	}
 
-	for (i = 0; i < chip->ll_rd_cnt && !vsec_data->cfg_non_ll; i++) {
+	for (i = 0; i < chip->ll_rd_cnt && !dma_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_rd[i];
 		struct dw_edma_region *dt_region = &chip->dt_region_rd[i];
-		struct dw_edma_block *ll_block = &vsec_data->ll_rd[i];
-		struct dw_edma_block *dt_block = &vsec_data->dt_rd[i];
+		struct dw_edma_block *ll_block = &dma_data->ll_rd[i];
+		struct dw_edma_block *dt_block = &dma_data->dt_rd[i];
 
 		ll_region->vaddr.io = pcim_iomap_table(pdev)[ll_block->bar];
 		if (!ll_region->vaddr.io)
@@ -505,7 +503,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		ll_region->vaddr.io += ll_block->off;
 		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, ll_block->bar);
+							 dma_data, ll_block->bar);
 		ll_region->paddr += ll_block->off;
 		ll_region->sz = ll_block->sz;
 
@@ -515,7 +513,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		dt_region->vaddr.io += dt_block->off;
 		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, dt_block->bar);
+							 dma_data, dt_block->bar);
 		dt_region->paddr += dt_block->off;
 		dt_region->sz = dt_block->sz;
 	}
@@ -533,31 +531,31 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		pci_dbg(pdev, "Version:\tUnknown (0x%x)\n", chip->mf);
 
 	pci_dbg(pdev, "Registers:\tBAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p)\n",
-		vsec_data->rg.bar, vsec_data->rg.off, vsec_data->rg.sz,
+		dma_data->rg.bar, dma_data->rg.off, dma_data->rg.sz,
 		chip->reg_base);
 
 
 	for (i = 0; i < chip->ll_wr_cnt; i++) {
 		pci_dbg(pdev, "L. List:\tWRITE CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->ll_wr[i].bar,
-			vsec_data->ll_wr[i].off, chip->ll_region_wr[i].sz,
+			i, dma_data->ll_wr[i].bar,
+			dma_data->ll_wr[i].off, chip->ll_region_wr[i].sz,
 			chip->ll_region_wr[i].vaddr.io, &chip->ll_region_wr[i].paddr);
 
 		pci_dbg(pdev, "Data:\tWRITE CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->dt_wr[i].bar,
-			vsec_data->dt_wr[i].off, chip->dt_region_wr[i].sz,
+			i, dma_data->dt_wr[i].bar,
+			dma_data->dt_wr[i].off, chip->dt_region_wr[i].sz,
 			chip->dt_region_wr[i].vaddr.io, &chip->dt_region_wr[i].paddr);
 	}
 
 	for (i = 0; i < chip->ll_rd_cnt; i++) {
 		pci_dbg(pdev, "L. List:\tREAD CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->ll_rd[i].bar,
-			vsec_data->ll_rd[i].off, chip->ll_region_rd[i].sz,
+			i, dma_data->ll_rd[i].bar,
+			dma_data->ll_rd[i].off, chip->ll_region_rd[i].sz,
 			chip->ll_region_rd[i].vaddr.io, &chip->ll_region_rd[i].paddr);
 
 		pci_dbg(pdev, "Data:\tREAD CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->dt_rd[i].bar,
-			vsec_data->dt_rd[i].off, chip->dt_region_rd[i].sz,
+			i, dma_data->dt_rd[i].bar,
+			dma_data->dt_rd[i].off, chip->dt_region_rd[i].sz,
 			chip->dt_region_rd[i].vaddr.io, &chip->dt_region_rd[i].paddr);
 	}
 
-- 
2.51.0

