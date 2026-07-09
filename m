Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012064.outbound.protection.outlook.com [40.107.75.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935ED43CEC7;
	Thu,  9 Jul 2026 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605597; cv=fail; b=Sd1KQHb3Qh5vakIC2SOZ7kRABrMDdgD8C62pi8V+/D/FDXkPIyeGdhs7iJWScmrFFfF2Xib6CrlaY/m2oCD6bCju4oZRLL/+YrtqBN+NyajBWYYj7qIs7F4SBCoBovhtzpE+ImYLO6N7TEUSRS6mp8c89nj+QCBqHaKuSHyoUWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605597; c=relaxed/simple;
	bh=6p/cGukaUb2oQjCRZGdmkMTDg3mDQ8wFITXpJ1oauNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RfP09gmVYstN/cWkOMpieRXLPCY/gLKOmSgWLuelvxMliW942clYv9+sNp8fkOphfkzyzMWS/PBCsdmuv6Kru9Ewyy2lJd2X3d1QtUWY9GJryAnmvIDpCa8RD8YWM26JnsyDnuYljn2rtpv3W4VLIJ0jwkCvTP12MKXSmK0X2X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mLs0bhQV; arc=fail smtp.client-ip=40.107.75.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mLs0bhQV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pj9DR5bekBUB9+GXc+TsJJ9QjmE5n88f47XF2xpqopo/ES2rjC26n0GE87l9YxbhANUPyoTD2Vj1Bjja+4zw2oaDF8PYrumwhOGFb8ONSzD380WYsuGj0ntVA/Jn9R7KtJUcuIFYl/sFhIcoc3BAKvShQIYJO6/c1bEY/g42VrLWufQfjD7BVkSkZkVDFBBVh3JH5jJJifOSJbwFokfEJzrLZKiMomMpwgnsJL3+iYndvXtl+Bi7AYtrAatPVdSgqiyuFhStiLk14/j+XXm5Vq2vzXNFHsBTD4hFEhMTvntC2k28UwmWr1M4wqV1Z7OL3SyTuHIVTNksk6U8a+FBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYiOO1nBW28zRt9b8+qiPXdic2mNqoVR0smq/1YxgJo=;
 b=kclhDYCMP650/HtNtQO78MbW8WI+AGSZNs5Lqhx4DFBvXsO8UbEFBGUvjYlQAbOZ4F1UvN0L9Ghdk1PVeX/v67Tx2xIgB9ylVPalqiVpaY9WTkRoEDBIumehVBFoYFQClVAOhU3iFIAvzThKEYH1oFyn/iikfnWfsjXJfyEVjyU/7D1tTyUzzR/208lF3VrhYwSNlxGFVef45uLGx3aZHm95kVo3zQPvi3NwxUwa7W8VtvjBoN5ChLi326WCh5I6B3u4d6epwC9uqnUNbXJxp+rOlw3NNTZX4cL8PlaBhMYEF3tMYPv9+SXOQcHcYoX2sP8aYBaaBaCRxWkf6GNNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYiOO1nBW28zRt9b8+qiPXdic2mNqoVR0smq/1YxgJo=;
 b=mLs0bhQVt5X8Ycjhjia/eoZuOBnU69/eopcyhT8cORu/0nRoakP4ViOfhYkbIYvp0EN8xdug5eDhgZ+b6Hvx0H1ZEPyEuWITMFFSrEjI40m5kqg+rgaiRkrx5CS1D3j0wTLVLRYaHcKE+6GM7bfKXPU8xcoES7+M7cAfsMdUNyUavCUJaXvdsexvJjAj5GtZzKmK9p5mVRa81FruGlI9NzPhIUAd94+3pCnZaWdcKk3NmhHpF4yzOOLInHQYqhdXHlHWqBQalHdcbFkE51x9PdKtBcavUfFC6J/ELDkkxrP4dgz+2L4yqxsmShjxvUGEaT/vbNM69jusnfJAk5hZqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPF271E4F3E3.apcprd06.prod.outlook.com (2603:1096:108:1::7c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 13:59:50 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:50 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 25/26] dmaengine: uniphier-xdmac: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:29 +0800
Message-Id: <20260709135846.97972-26-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPF271E4F3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: eca10363-9fd0-479b-13c9-08deddc257f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|52116014|38350700014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	RaNyzVuLWKAzk4rOt0zfUYGT3/T7kB8+KwFufnO/fx/mv2bst2tJSEtvy2ZQSI0pmcoxzE3IxvQMH9+4vVlAx8O+XAdS87x6ZbRKHHddG8cfGXi8cIuOj2XK6yboxOpxt1DU2chc4N3/KsBFZgFzuINmqBQnXSBYVgm2U8+4UTbH894jM6VY14bxqOO1aIuMi8a4TaX9lt/cbC7pYOhGfzXpjeaCDDZPNyESEaOJI0DE83ZxNjsOFlQ+trLDHbfbpUI5wW/YXGE0Zh+vIrQRQuaI+S64Pn9HBtBHV2V2vzg/NLAQveOh4p1aOS4sc/C4/Ywv2SBpxMxYxb26umOvx7F2+h00RSO15ZcR0J8j7LNvRYPwCwU1ikpgS04j8ZwBP14WndeAPxcCTR3V7K6bYBoXlEpQ/wbAgilda9sfmSyGtWEyZ2VNixy+1meA0whpl7H1PYObWMOezynOpKQN5fkR5K1PfsyzzOkhyqo9iSzV9eCTcIcGtkFtgPLpSH0LvRDKgB9ZTOMphl3VlUGfg66v5mtpGZB1t1hIjOJzbHvOhYndrJV+e6FFbVO8/WgPk8yOX28bSCb6TwOBUG3slH6VJiBiCOb618UWzTtwDU7QzaGJ8SHhBv+hSozWbW0eN0QlNlku8gaghIDuyW/14Khl/BfzuzAfgGaeUURg3QEr7iMDWbFinqpFgwIjDMg2UJEFWXL35ykuUkezRjoWwqplvK7GxxglSkr/Juxs5TE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(52116014)(38350700014)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wgCKI+jRiNPs2CEjj2MAjk0zljqDJ3JR8J6w+aEY3AiGs39QmWmH9ozapgzU?=
 =?us-ascii?Q?pcNXOwdkEyE36ZJaSz3QDngxYicoi+dApUgKkiUwDRVmiRMZgQmM1d2UbCJ0?=
 =?us-ascii?Q?0wfGSEk5PgiEkIoe+jzonnSUGSfeD2m+nxzt69QK2e76lfMUseQM2AL2+T5a?=
 =?us-ascii?Q?dcnGglD5iojKSJ3Yvb6g/T2SGT77zDA3yCujgPUfdae9uVkWnrYESIpgKK0A?=
 =?us-ascii?Q?d/1dnc5nmH2L7EDs6Fi++ym3crNZL8dHYBqZsL8LByvXsxJjvtG+D6PZQeK6?=
 =?us-ascii?Q?isLP8hW5VsQo0mkp2IErnV+hUOVqlwQEbSDE8GyPfBiyP5faFRBc9eEG3XLQ?=
 =?us-ascii?Q?HeQIUocaE8H3XWRvTnJIyrh0Ya8jct+pMaKimhhYXpJlu696ZquSOSp98h2I?=
 =?us-ascii?Q?DreZB6aKnwQuV+xje8KXwHIkLK1QLqJ6R3GkEtIDZ1TKbwlQeloCQxIXdyyp?=
 =?us-ascii?Q?wb5kG1IEwHTaJmIDV381+3+MUTNq/T5/30HxSh5pdBd6xN6P0V5CVdQixvkp?=
 =?us-ascii?Q?PbxjC9Nuqs+fZdM4jjkRDq5aGAeOb55djbWJDkXW3MdxarSkhlSnSxHuHf2P?=
 =?us-ascii?Q?rWPRcfnU8Cceqf16eknOn7v2BPfGvTs+vcw7v1DHLEkkyZDNexgUI8pruR0c?=
 =?us-ascii?Q?AB+rLqIoN46CqpL0jlSmuFIT8hWPY/U2XWFOm4Ff3wktHUZm0aOMWyWbGbbs?=
 =?us-ascii?Q?WuiI0j6pJ+61VOBJAzdMm4jE0rHeZiPIQkrmxk41Zj66EIyJRd+AZRlJjCqv?=
 =?us-ascii?Q?PacM8k6zGX3Hdhuq8CCkOjIorvE6AbDlFAhsvwScqcn8AO1TF5EqrvioDtl+?=
 =?us-ascii?Q?mOgejxGdvMpRnoawzC6mdS7xv2K0V//hWP3DVww7WE1hNBaXETA0yqNs07gw?=
 =?us-ascii?Q?+1fL/26p9xc41V+WAjw7HS2bbcBnhr8Rh+tja+ikhNZUZey9xZYZhQALmvoF?=
 =?us-ascii?Q?M/DI6WRXp+379E3BLqAoavWAD8Q0o3pdIK1HmDbtU5ORUOf4oHQt9XxnmASQ?=
 =?us-ascii?Q?CHAlTsay3zlZEw3+Eu9MTXWDyCYJsEWWb5SwMH/sQTBFt68KB8W/0BP+Far0?=
 =?us-ascii?Q?LFyfG1lEKMosCee3GqV6ZosCXZQyxfVRhKFDJ+K0fbUhgLIfXwq5MPhR4kYD?=
 =?us-ascii?Q?sgvMb6UMA1FELc0xcVDbz+rgZofOcCtDBBsyJeXubKNrQkIpnq4HpTSLXiP4?=
 =?us-ascii?Q?MLxWBkBX+vUikqMVJDSH3UAOP+QyR7xB9NSId5eE5jUIbi5D/f4SMLB4L87w?=
 =?us-ascii?Q?VNpo8q7+spp+9aH6Zo7eBEs1P0Nw0YrTX0Cam5xFyjfAImsNRJ7FXwbKykwh?=
 =?us-ascii?Q?mGIWhe3SHkcFTK5duBnTKAsG1UM4f3U9CKR7VtjcxnU0u0I9Cdy+02Wurmuy?=
 =?us-ascii?Q?5h3Kt27kdzyumT1BPEhEopsSakyX4D/mqZFQEzCNUjGrUDn62A9dmYKsEQEb?=
 =?us-ascii?Q?L7uFWx/PIANwC4gX3dpq71ER4obYkvgKVcuUh/oD3R813lqs0tg14TKODdme?=
 =?us-ascii?Q?iBthyg4Dh0j677W1NRTwRZumr18RP5J2C1JbdGv6eNYpgC97SHVpvEWuS0b6?=
 =?us-ascii?Q?JOoU+/izJ4KYARmkeIZ4pWft5J+YotqeYuEBmc6wHUMRNTglwBaU+uQgXuKO?=
 =?us-ascii?Q?3YqBDhN/KMpXPsUgR9llv7+KfQx9iGwvQtJP9HW+Co9qvn9/sG09gVPQjDu1?=
 =?us-ascii?Q?jVwSM4R4JS2C9G2XVu7+ERKmt7cvAQy43IFCUzkZBvQCTKmVysObv4LCGvgH?=
 =?us-ascii?Q?7akpN+Q6PA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca10363-9fd0-479b-13c9-08deddc257f2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:50.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6NBeZ4RCkzSzd/VeKn2iDeMV5o5FZ0xfyyOHY4ZzBIrZr2eY8j8qjgQsBJsOiv7hylLB6qPqMNEy6uwDnC3eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF271E4F3E3

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/dma/uniphier-xdmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
index 120c0d4f12dd..b23d61bf7fd5 100644
--- a/drivers/dma/uniphier-xdmac.c
+++ b/drivers/dma/uniphier-xdmac.c
@@ -532,10 +532,8 @@ static int uniphier_xdmac_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, uniphier_xdmac_irq_handler,
 			       IRQF_SHARED, "xdmac", xdev);
-	if (ret) {
-		dev_err(dev, "Failed to request IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = dma_async_device_register(ddev);
 	if (ret) {
-- 
2.34.1

