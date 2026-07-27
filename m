Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7783B42F710;
	Mon, 27 Jul 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171823; cv=fail; b=AaVytF+XmACgYmPYQqTdMThTRYGqegC+Eis387p6ebX8kTDoZG/HpyO67SPNP0JDFg/pktCI56dDuP5VqJ7XqpotvmLEJmVtAfO/IIn6JYV4sdzuF2O372uzkCiz0bJ0fzunLBl6a5VvDItw6cTwtfy+9JLm8UZ7eWVN+MLufCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171823; c=relaxed/simple;
	bh=gtCGm89jM5HGKSWxwtNaWxRoUEBlMO56YItLpE0pLnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CElhzh6eToYHuJbDR5UwYfS2eNyYz9Dw1vMxcEZlAvvIUap98SvNx81PSI0GSi5PIn9fclaq6Gmigf7ZjvjO4gs2Pi1SMgsC56DHq75naDyHIA9WlTzHtfSDS74xQHv9Zx6Q59KSyOBsrGA8JJacwUC/ftXHBkbqtuOqBiXj9jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=iO98x8Ls; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="iO98x8Ls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY5fJ2tfky+cijeqFEuYBNKD6KulLQx2o8jtWVLuyp88tOXAQm0MFRKFB8GgbIrEmS540Bzratc1WAhwCjeP4qOXWF+yt8RKvh/tg4nLm179mPyAb7CequHgYWx7Urk1p38Kx52VSY0Nh5dFGVmS4oFDHC8D3bV55sMRCJ+Aj3osJRdS/wESLzMFHKTTi1gbI+CIwFXB4lp0TtCNOGIlnQ9oxdGeCTsXZnot+B/yfbkxgjwy4+Hll9M8AQbupe5sL+MWzlSxZCFmxOwFhJ9qxsIca1qg8TrlazuRlEYC9tNRo+E0b98Tqp0BO4hMENYLAMkiHcbZq0HWNfqcTgjLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVoLYJDHBZoYF7IxdPo3CVMBfwbKtnizqB2+E1ITewk=;
 b=W1WxvpnBbD4mJjwMJqNtj930rWbaRXKEioAOjQji4tfdUUT+g5f2OnpuNGgTlBFUZqrhPKf6f3WS/Mj4KzLRYOtmsOkw+F+G9LfG2SWEe7qv00hWNAgkLjRnBa63NwVZEr0YwV6b5fyWh3BBG8aKBPXD3Jv1B24HG3HStZtyStAD/fvhilP4XVPvVH+xG3OLITWW7w5RR37jmP6JzWkTdlsU8ygS9xcCc6waWej37Pc4B7dvfw66EvRdv7hxtQ2KoZa5wQK44yJXtbqOqtVyQVODvBSLdxCoE9etSykK/HvBxY7pQ9pDCuBM8LZbiAJKbIO3HQCbhYlWLlKaC++bmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVoLYJDHBZoYF7IxdPo3CVMBfwbKtnizqB2+E1ITewk=;
 b=iO98x8LstbOGtbmeCRBzETueiCV7BLRUYJi5rbCzhc0vHOyoncpSaCwQWff1KnLk/FKvH1MdyQVGghLldMwM469drvlpXMHLPrhF4HpdJ/xxyMFIkgoCMLCXV5iKkKEmlbNaw2DXCT0XOQzVR5EMR6tE5WQ0mUOabpkR48HWC7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:35 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:35 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/24] dmaengine: dw-edma: Move callback result helper before LL helpers
Date: Tue, 28 Jul 2026 02:03:04 +0900
Message-ID: <20260727170323.2321369-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c991a5-ccc8-4cd3-f9f8-08deec00fec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	zqSrED/0+fPBxG7RJ52ZSJoIxOLOHDr7VjFEsvRFfgweJuSKjTTkWakyWBWm1ckjh1Jc2ncf9nMgi/HQMYxBOME8yaa7W4Kbl/yKUNdlXvguEiSofkMx2H011PaPxnjhZKYObRStmNNKxbz9WuyJHTqErYunO1cw+WKe+FkhZA0pHB2U869elbMytXmL/sUAzhHkEU/SPXLCN6p3W4QgcpTOdtBG5cdcm1L7RH/aL8gUQWXZNIDvHIqKzd/Ho4blCNgDBP8EExSmYRPebzSSkJYF3n/qs236qte4hj82YECxyzEPdbAkprbrJkhUMBMHHvfeqXDC0Ilv0QIjJFPwYLH8DpztPObN9wcBxTvPDGebCqVYeEPHij6ie3NaSaZ+t+39LBtCAknraY4OiHq6tDfaH2uY+OIy+HD2NRasBxtvjbtsDiGZq46YzXA6bGbi+EnoylUiJBd1mQ0W+nFC1AOe3tfFWal0Xd8u4QJuF48BzRa+//5im3I9C0INuvuDpxFbBTBlqaX0KK38hpbtp733Z84+QChRgeRHVkFdaA7LQWHIv3rHxVpxX+JgHh5CUzJ1R4Fp52mg3xvBg28U54ijbQBormkEArv2zu8c31eb8HD1Tx+B3ogejo2L3fAvapnwWRnoh6A74FeYpCdHhReQF1wPM50utBrWW/Fjk50Py+qVTZIzGQxYO9gZ0CXLFx1HZE8rKwGl7dyDmSW/EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/u14B4ui5ZY5IIGPRUfwuQRj21Hv9TpxIaSXEciXWPUjaBkMPJxbDxvvy/pO?=
 =?us-ascii?Q?xacssPxu2diWFgouLxfj+S+VNgF5sS+buyNTETFrRzQ6yTc7Kl42gJIilFNA?=
 =?us-ascii?Q?8QDjsg7F9edWa+enlM2imhGYRLvhNA6lGL0c9dy+gdNCOiCYFrg/T75wrweh?=
 =?us-ascii?Q?DGvqbDSBFJqSPyQdeDjjzXtQou534Ves3mJ5TWMhR52crkBvdWHw8pAWmrUD?=
 =?us-ascii?Q?LjlZHxL1YOU5L7Wm2yMhbcbGJYyxC4nGybtL/NjaA8TChjkyVjkGXyfyio5Q?=
 =?us-ascii?Q?KsrQlQ2+i1xeAtz/32dWMHoB5oWu9s0h9kbKep719aP0F8qJEjFsmvLed8hY?=
 =?us-ascii?Q?JH1LM5eIbuuCJJhK/XYWOJh2iHwJgQLGGEnSJ39oWy7yepSlDycg0XHpxZ+L?=
 =?us-ascii?Q?tcOPvIq2k0fs+sT7uOI9No6nOPlMX3fkSdSk4EDMP9QMYnIK/YM8gDFzsvEk?=
 =?us-ascii?Q?2mp9uZQEwlCV5YXn52rJLtx7fUc4fklLIfBq2mDlKIkai+4TIHF9VkrprsHA?=
 =?us-ascii?Q?/WGVCVMFuIE7oYJyrtGbjnPAtr0sP5dZlvrerWpGcsjPRoyNd6U9nVd/NUly?=
 =?us-ascii?Q?oioIObPydNyiq4RlXXolC2dBerrMB4H+fla33SpLEU0G8GqqqgH9OEvqgRXE?=
 =?us-ascii?Q?d2q39LoB8+xcPHMHSr92f7fD2AHnfxINv9kRuIzx0S1CQpnlRX7uqCNjpbTP?=
 =?us-ascii?Q?6zCXImgQ6jJ2s6mfuv1eteqXGNO5DXssRyOqqaU3TboNPcb1AQZWjakexZH8?=
 =?us-ascii?Q?dXtS6pn/Ebtqoq8W+EtxbLIrY3RRMJsU2YkJvV7PmqtSPvsBZBiObGh1khht?=
 =?us-ascii?Q?9O5Ve7xD3Vz0hbiPbinZxO4pGxchnBbMymwUftwB3KOV0VWEEmcw3Zr649Gv?=
 =?us-ascii?Q?xxnG1OpHM1pXWE78nY2HcZnIXnF7aUtKJo682a2pAFIDsFSplunzPCiU9Nks?=
 =?us-ascii?Q?YQp/HVZ61Qw7bjNoCDLDqjhlN9Mfc2o1GWtkFt0EhVvdSPcRHQdHXQWgemiF?=
 =?us-ascii?Q?eaLyoSNl5Aas301ZtH+ykzjgvjxeEeHCoqe0H2j3SPfd1p99bPKBpxVVCIWl?=
 =?us-ascii?Q?CaiI0ph4UDrVtQyKU/AESPTNpMiGGPeQxNb9Sno8roTigloh4JfWNfxzQCCH?=
 =?us-ascii?Q?DxfKmdgcYxsqPTTbTUTwQTeVhTrimCVtFZ8mFHmJteBFdtYIqeWNJN5GNCTM?=
 =?us-ascii?Q?TZHdemtVFxqmgpn7OP+FXdW6VY2GGPms+pMO6dt60IsB7yLuhZA7Ha9VBTM6?=
 =?us-ascii?Q?mICvolZgKokSW7ech1Om0wX7I0SO9e+noo/BuxbQGTfKTaJFkKpTPaTWmsQ7?=
 =?us-ascii?Q?BRysH8jgofsFBl56Zt5x6U31+0iT7Y4VlskvETdcB7o6AKLjbrvZSHKWw1cT?=
 =?us-ascii?Q?iFtJFi6uu89wQm499kagwSiCL3AnkouqDyGJxPW5a2EPLA+5zffVrMv5KVUa?=
 =?us-ascii?Q?AeMJ1cmlLgPJcv0rZ4Apag9Uk+VtheS8OPzK9uZjnRql8OmdIb2dyWEmkXsI?=
 =?us-ascii?Q?ffioB+WIpBTR+fs+iLw49qCTvypZYsHqBpp5jYGv3FDmQdde0XmRdYjzAuF7?=
 =?us-ascii?Q?GYY6h+V9lxA7w6zwuHPBIv3AUvxvYf2Giw36R7F58uGDpMsFyzI0Fx+kSAz1?=
 =?us-ascii?Q?Q8pzWSsHkceSrd39Fo+UvcLzwXRu4QF0mb8wauBn/IlzcYFZDk17ryjYcZv+?=
 =?us-ascii?Q?hcssEl965KXoNe1uTag3WZGWCTxsE606XIjYLqf4UtrHp/Umm3EhMxWCNq9s?=
 =?us-ascii?Q?zbAyLcVdYFpRPL4ACe0Z4bG237U8uL7Rausoc3CBSArVM+To1zUB?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c991a5-ccc8-4cd3-f9f8-08deec00fec8
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:35.2410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkyJA9voiERE10MFoO8BOLwBFrMxov+E9gLftPZoZRD+eI+aLAoqN2ZPZoJTGWwd7Ge6/cMdpUMDMXVt32vZdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

From: Frank Li <Frank.Li@nxp.com>

Move dw_hdma_set_callback_result() next to the descriptor helpers so
linked-list completion and reset code can use it without a forward
declaration.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index d7a8a43b71d6..6e7d1f7c20f9 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -73,6 +73,31 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
+					enum dmaengine_tx_result result)
+{
+	u32 residue = 0;
+	struct dw_edma_desc *desc;
+	struct dmaengine_result *res;
+
+	if (!vd->tx.callback_result)
+		return;
+
+	desc = vd2dw_edma_desc(vd);
+	if (desc) {
+		residue = desc->alloc_sz;
+
+		if (result == DMA_TRANS_NOERROR)
+			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
+		else if (desc->done_burst)
+			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
+	}
+
+	res = &vd->tx_result;
+	res->result = result;
+	res->residue = residue;
+}
+
 static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
 	u32 i;
@@ -660,31 +685,6 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
-					enum dmaengine_tx_result result)
-{
-	u32 residue = 0;
-	struct dw_edma_desc *desc;
-	struct dmaengine_result *res;
-
-	if (!vd->tx.callback_result)
-		return;
-
-	desc = vd2dw_edma_desc(vd);
-	if (desc) {
-		residue = desc->alloc_sz;
-
-		if (result == DMA_TRANS_NOERROR)
-			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
-		else if (desc->done_burst)
-			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
-	}
-
-	res = &vd->tx_result;
-	res->result = result;
-	res->residue = residue;
-}
-
 static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
-- 
2.51.0

