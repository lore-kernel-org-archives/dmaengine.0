Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A240927F;
	Tue, 21 Jul 2026 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615323; cv=fail; b=rdHWV3uRJEGmlxN/gY4Hr7IZU1nLKbY5cZtoUkeG2zeNzF0CZ92MWBsmuYugm3MmlFpFd2NT/s5RKcjDereoKtlqigz5GWQXrko6b7kXG9AOhTvH+DUaG/yJGK8dn+6+eX3ysIZDP7LLIDKJiwKXRnp26BqM9tKTgn/nk4XgVK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615323; c=relaxed/simple;
	bh=iIak0+GB+J8PFKluS3rqdBCFSIfjUH66SO7E3wJ8U1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1rONjuDFrCtlw3rTZ5fxBlGHH1FCgJxEAwft/6NYu6mXLdvWuFQgAcb4sjCZT1GyNQ2EfaeV2KGeI0CKNvNp2Sne6hT8yHp2IIYZJdh4hiCw8aRD/UfsRGI/hyp3PyMm4Hcbo3VcERyuTL8cX/06tLB+oUCQ8JTD9VaGa7ygMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vZEzHxMy; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vZEzHxMy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsWijzB4l3iI2NE1ru0QuZMXFg7Ch90XrGGELZWVEPrjcPbllThqro9e8pyUsQbrlwnjLi4qysTCKm8qZPOfCWBO5YVqvaeGN0dzNabUpEoOh6xHMw4z6JO//VnKrv/ZBLhxS5mCrl6ZA/OymIF2P8AlIqlHHhqlanFN58qRZE/s7pR+2dVMsKYD97LtxlUlggJb7u84Vg6c0EqSvMMS5Q1w1YPaUgp94nC6WNaqPchrWvo8M5jpk9KEs9Dy12t675Tg0WAYo2pIaSAjv7dNRgHfd2HAPFUTrAZ8cqS3U3HtAgp31BckkM+/7yzaVpwei/gMJW7AKgMgyBiDOs7elA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkzEhFhUVKWsvPhtd3aABujLtm7hKd5K1X/t0vcHcFE=;
 b=BZP9D54rtp8CQ/0zqieMgCUSwO+pQDNyyTcYa/NHYE+oAtw9Z1h2YW3HJyNAzTYtN1w/3uED6E3zsvhghORMg3UhI212zNSFV+s00BAUk1PbL1O5h6UK9qg/bYC7hvARTYrQ4rWmPgVRoFxNkwLJYhbyESE27AiWUNp4IfIC18AKRtUGmXfmXUmZVb6VwN73Tq7sfldeDZSovwlBj+L3QO8LoJBFwwfEiqJYn+j6VccHF+dT8kvxBf1j2MuGaVBejVa6vqSE2a2jUCOxaQL+xhY7/tOXjuJVSiGxoj0NuglfeTkrgyopLks2LyOQzek5bQ1iprstozjziV5qKST1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkzEhFhUVKWsvPhtd3aABujLtm7hKd5K1X/t0vcHcFE=;
 b=vZEzHxMybfGeJ/1bpk75Is2fnIV+y2EjssSQaRRbr4Yg5836+vp4bYZt0QvmSPgHm2g5cgcWXxzljYuHv9p4Nhia0zcVgLE7FQMWYsJCgSI3lVUvO0MrjKuYpkCKR7jjJK4JfWnJ6idPl8nqPykB0dwn2zNofPq/1hU1IjzrcUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:24 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/14] dmaengine: dw-edma-pcie: Add platform ops to match data
Date: Tue, 21 Jul 2026 15:28:10 +0900
Message-ID: <20260721062815.4117887-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbdcff5-2120-44ac-070e-08dee6f144be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	boP3eR8FcHZwbGJkA0UvNDkokSLrSbKyugMc4Sdmo23w8BMLRzf4LOyZaEZggsxY6HK/rcWsBrkWM7YgsKiqtd4Pj+MxcOEttS29XJ5/TqA0qnKHj7dNDWUgE/mHhgme5hB2KGhOLdeGrBxEYMBlCXDS97TPLYzhW/RoVZEoG7Mdya0hNza1TGTnfBvt4yMltsexSC69URHW4Yx1wrcJYuaiFIcGGgRjSZQ8pVZC8XcKk+YflIKCCzMjDztbPnhO25pnlZWzUDbtK+KvVX2zCmVqj0wyn10gBPyVknQgLObiij4MmbaNi0dht0/H685Eeq9AIB2cbAhql9DT+WclN1uLUsxIW28ZUI7rh0slMnFsYeO2hCqADP/xbOaB5+86W2TaHW9Jt9PiVPWU3W/+PtS9i3WwS/jyqi7iuLcEOFIubyC07zrsVKVcGIE5CACCQBFt+BP97/4J42qlR/3WCnLZnoGM10gJu39TlWn1ZjbicIepMjAkmUZz4IcgfvLPbt0bDd8TuOhING2JXCLdxkUr5lX6bcOPgyNbp514QVYW69CF7vTfS1Z+Qj9uoDOR8rBe5+6P+bKz3a0rgxBq+Cy91NTs+G8jYlDWw1CrkvY/sui2HGkPyhjAC9YrgNZ2mpL7sHn7aDg3WMPJFmTF+uiGlcrpE8qqRXAHuPR5VJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1/WVJXI73GPMQOeRd7F71admPUZ1hdbPIgMJLs8olLcBxIRefiXPbdZvY4V?=
 =?us-ascii?Q?3N7QXAk9iSd8bcLMUr9Bz9Elg/Ep8tErShaEY0PyGlpLn3RkqsnRxekPaCdB?=
 =?us-ascii?Q?/pEzkow8JJmwPXvNesG15nj3RxwMpLPbkiGMdpyusAtajz8ahK2HDKaoKAwh?=
 =?us-ascii?Q?DkeuXiYwjZz9ZND6o4WAcS9Vhi/VNhp6MYGFJEdUgGiTxOhfNyv8COZoIg7n?=
 =?us-ascii?Q?RcCLgp2QGmr5oUAMYxrDfZ4YxNEAS+bo27G0HH5Va29LEQgV/4IKGkc/XFLh?=
 =?us-ascii?Q?iLP6Zk628J+b70OY7e9yFDHV1wwXAWU0mzFg7npSdsyvUyLkJUR751bW9hzf?=
 =?us-ascii?Q?6Bil85pDSxBdOa/Lgoa9XMgsekWA1kJVqrVYFk63iZ5cvWypSBOdEe7c0WRQ?=
 =?us-ascii?Q?oA/1PIF2mkjlbQsIKt7wdo+dJeNstYRzsDCyQJE76XG9AVHaf0fX9J970K9W?=
 =?us-ascii?Q?UIncAuRvWbn62npfdk6ciTgB9+I3B+f2XE0b+CxqVHXfc4A166wxYfc6jReX?=
 =?us-ascii?Q?OUp8aFHdYpH/GYO7qN4q86W7DyMOqaOfRlSFAFjeI3dfuDBZgd1Mf+eWkaQg?=
 =?us-ascii?Q?GFJl1kMQTostOSlcazpz/6KW0oRvGxlB7Hx0oz6WtHRAt3MqsfqS/NFz93if?=
 =?us-ascii?Q?rNnoc9RJAE/LlLWpPVje10RmKjAFurvD12O+G1vRh4rbI/Dqw4ezgR+mRdU7?=
 =?us-ascii?Q?e+zYG/D2lrrY69B62o2qBsSlPWDw6DvAtWlat+ei1byNOGCbC6QsJG1tKrsa?=
 =?us-ascii?Q?5gJr2jxK1vzyKBdBt3ZZFreF61GswoI3c2rTarQW4n5tEV1nZM69y8pY1QA0?=
 =?us-ascii?Q?yPZekZjjbsUdGqndYkgk0sN1sVAJH5lmseW/jzyxGJnSx3qFQLuQ+XmpmmIn?=
 =?us-ascii?Q?Yzk/r7yIIE8blwrNHH8J1Zww5EhqG3mrthLOmL95XLxNQW0BCUKe/t7U1Yuf?=
 =?us-ascii?Q?/WxPW0fVXz3pcE22hdKVG4o1lyPz+tfDUOg2GMv2Iu/SWp3JlRQbQHPfN1BR?=
 =?us-ascii?Q?MUkb2WkZg7bR6cSZzMKS7EBiXqKUCM7xgJR+bkit7ldSP/Va/b32kHuZrph6?=
 =?us-ascii?Q?allXi/EkQfbIXGWHUPH1C4rtMUyawS1Gz1aS0Xek7XN4mYM8ZdihZKzqjpMJ?=
 =?us-ascii?Q?JZChZPyMh/h9q4A8YVZN8pNzIENwmXv1FbeAncKa/HCtPaDQLzzBJxGvmYfR?=
 =?us-ascii?Q?YQEDDI1xSXIlBwZQyXBl28Vb6nI2gcj1hFFqtJUKhrlWDuRQbi00tN+jLf9S?=
 =?us-ascii?Q?kHhj8i17zpCJnZ4Yojw24TVsQi+Tr9pLDHEukOiF1NALWea6DFMGH7+kLfQ9?=
 =?us-ascii?Q?JTPigfTg9batcYjuXAPgrALAx+8oiCiEtDQ6WrmLB1HJAQl5E3PTVnTzlk+I?=
 =?us-ascii?Q?PVgZvtl3XT/26rekXjVX2YcvE+d3sag1ydFiohISo519LxfLGpKUSiIWy6LZ?=
 =?us-ascii?Q?8R+RMLRp391Dk465JLYaBMYy/WS/cNIqvfvEPxiDhegHDZ4BkWwio3EVvhW4?=
 =?us-ascii?Q?Pv0SJsjsbwYblCH/9wr0KVt0Y7tQofE4PsLz7Uh2OgrI7G1jkgiGjDWULEkM?=
 =?us-ascii?Q?rFwOS0f8NemP2ddJ2IlgVqsMlRXxuBcEnZ4fXNEVIldbh1zhQmHpQWYp6Qjr?=
 =?us-ascii?Q?Qmb0tFiB+qrDkTJNpMj4uVoXMS+Mcvv+hXtLfXqi8mVQOCfSgsBCV0G8cU06?=
 =?us-ascii?Q?kfVB1e6/h+Ryru9Mvvn+QMDmSdhpc4jmKVdcFAEg0FESAQ7AVCW1xN8I0c/6?=
 =?us-ascii?Q?8HpBBjc8JEuTScFslhXXUEpSaaTBB5dCjDe9RVWpdE35uEAaSAi7?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbdcff5-2120-44ac-070e-08dee6f144be
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:24.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdHDgbFAPpJIFUQ3x3fP2MAMqwDZpm29wcm5rI4Pixzqi1FBMwVJEWYrN2MfQj/4wISKtkasDV5Ew212Y29ibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

Move the platform ops pointer into match data. Existing EDDA/MDB/CPM6
matches keep using dw_edma_pcie_plat_ops.

No functional changes intended.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index f79597a7ccf9..99ddb6e6da34 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -78,6 +78,7 @@ struct dw_edma_pcie_data {
 
 struct dw_edma_pcie_match_data {
 	const struct dw_edma_pcie_data *data;
+	const struct dw_edma_plat_ops *plat_ops;
 	/*
 	 * Mandatory callback. It may leave @pdata unchanged when the static
 	 * template already describes the device.
@@ -403,7 +404,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	}
 
 	/* Let device-specific discovery override the static template data. */
-	if (!match->parse_caps)
+	if (!match->parse_caps || !match->plat_ops)
 		return -EINVAL;
 
 	err = match->parse_caps(pdev, dma_data);
@@ -454,7 +455,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 	chip->mf = dma_data->mf;
 	chip->nr_irqs = nr_irqs;
-	chip->ops = &dw_edma_pcie_plat_ops;
+	chip->ops = match->plat_ops;
 	chip->cfg_non_ll = dma_data->cfg_non_ll;
 
 	chip->ll_wr_cnt = dma_data->wr_ch_cnt;
@@ -593,17 +594,20 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 
 static const struct dw_edma_pcie_match_data snps_edda_match_data = {
 	.data = &snps_edda_data,
+	.plat_ops = &dw_edma_pcie_plat_ops,
 	.parse_caps = dw_edma_pcie_parse_synopsys_caps,
 };
 
 static const struct dw_edma_pcie_match_data xilinx_mdb_match_data = {
 	.data = &xilinx_mdb_data,
+	.plat_ops = &dw_edma_pcie_plat_ops,
 	.parse_caps = dw_edma_pcie_parse_xilinx_caps,
 	.flags = DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF,
 };
 
 static const struct dw_edma_pcie_match_data xilinx_cpm6_dma_match_data = {
 	.data = &xilinx_cpm6_dma_data,
+	.plat_ops = &dw_edma_pcie_plat_ops,
 	.parse_caps = dw_edma_pcie_parse_xilinx_caps,
 	.flags = DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF,
 };
-- 
2.51.0

