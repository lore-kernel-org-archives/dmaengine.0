Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76E47FAE3;
	Wed, 29 Jul 2026 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335454; cv=fail; b=YNQFEmp0My2MJU/l4bbug48o6z4y+koqjrU0n9uKEsHQ2iORzGoD0MeeKAzFKTLu+yIrWdJMUmWxFYZ55mwfVSNqjYK7qh76n/gfs37GYAKQWLTiW/RVFwsSe97FDgVzjbl8Zp3bLBXHl7C4KNVnHz2hr0yKCo4YHU79tD6z1sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335454; c=relaxed/simple;
	bh=riujK5+PpUS2TMCcTavC5y0+IlKFr7w67ix062aCh90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J31KGdnw366kJ3T8EadMZZ3PoIYL4tCIrJ7mly7b3ofTJftHT32xQUptXROXFApSrhH/R5Vb4Tx/JLeH+uBOajcgAjH8Ux7T5tU1awzX0bmk7uQul+/pAFHvy8/LQh2xOuGBPfqWXoB+dX5Ket2C8jso019OeunUCIUTEAwx1Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=j99Cs5y4; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="j99Cs5y4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWo1mAU6NEBlTYVfd+DVxsbOUUwI0yNjmbCwEZ9cZMmvUda9TlNye7DNZPAEZ/4zmVGu0Lc5WuUUWKXZhJiZPpsrj05gaQ0wFaSOPZZi28cGClM5SJtwpy6e2hF76bubjjdvkcpTm4whahiDf4f9rQ3QW/7xwJgr/tN0JecwcMvWhR1S6jvF6aCcGCXgexIoW1i2uXoSEIGGHJxngmQRtF0oGHSqQSKGzQ0w5ILiE6ufc17HydWtCCLS+Nm4zBMMWBz9w74BNDqxWlPuC4Y2IDOYkVEc+QjYI34EYw5i78lKkI9luBS86hEpj6gCVJM5OPOhbZh0Pkws9E7QuGTD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p02ifURwNZxnpSPeYLOecbFGvyw0jk5+kboHMB+Y8ds=;
 b=lSnUb1VEahs0oBQwiLnVW9AX1cRgqKYFjpwdgfzenxesy/SszzGAn9hata+bVtNHIjuoa6K/ObWJBKxbwoGkRUglk9zh5b2uDe5eLXq3YneSFR7vtcZEvQY5eqkOQazJ62UOGy4GZIFA1Z3lbiZyCwX0WGz0ejBh8dfbzf6nhn4hlE/v9XqTT9trLjfz+MYP9HptdhaN44BfQ8Pd0izJhB5HThuxc4xPBAFg0McDodZKh+f0o5cFTaF04WoBDlY/HtlWTs2ZMT9IB8C64aaZTHW2jV04Vb2h1WPdPZF7l8Z/H875zRsfcRXNaRKe2Ogk1kjY4t68MQu/1m7J4myzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p02ifURwNZxnpSPeYLOecbFGvyw0jk5+kboHMB+Y8ds=;
 b=j99Cs5y4spJUVXnffhlRXlc20wDNUJM2V9k5cZGWWOkC8Qeoxi2zhDYGe19eDIdpv0A9bybQxXtlB2gxlUEHug6p6GrpOFPH9WrxyFpyADjZdqQF3vBs7CAFBSTNOKpCMfG0SSQeNi+5W812/UpSttHgLGUpSl6x4CFGGXsju4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:45 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: [PATCH v4 05/24] dmaengine: dw-edma: Move callback result helper before LL helpers
Date: Wed, 29 Jul 2026 23:30:17 +0900
Message-ID: <20260729143036.3087722-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: b23b2942-d0dc-402f-b15c-08deed7df9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PqOSp5SY/k+iUQ1uOyVjhW5qtSBGAwTq8D0xQz3TDrrHfLg8vkPbVz8X+qODAnv2qTFN4tlimVJ3AMpZoQDcfZ6HdZdzx5dQ9x00GcNpr64dXO5X4B+fBx4Bu7EHwfxoE7BJELofukxL/aJ0LqtWg/PjcqvUPAv37+E64WLiqnyJc6tZQvsQ2O2Loi9pBFt1mx2xEuQ3WH2tANNWTQnayJZUXlItdzroKB5XyPn9cfT1GiFcHYD9CWPHWVB117LnSK5gxO9tel7jxnoFvs/k07sLK90117e/2tj8qB/MjQTEOaMm6/vu5h1Ns7XXFYBZ05flCA52fxlYcK07T1e/frckTKWCSGCoNUbMCQwSrd/gZXfsER+jgzrdxmiXBeepcfdxXZWE6Yc2Uy4D81YeEWi2sRoACZLZ9pCd+ggB9WcmjrWT22MkrUd4BKPzi5LWTf8YbQ5iEH0BP0/sXlIodTVW1RFQfP7OlWyNULsL/B4UHrbCxCv2AxcjgmQvmtPOSTeiPXmIF86xI/f5W7N4bNDFyxw23khZ/GYqlueCjqy4pbd391YWwvy5IkpdwzbVry0Zj/Ckss3LOkqb32hOEzNqrNB7Xn3VDFlZyzRXYBgqVfF41DQjeFZ8DQgv/ktLCOBEpihUX8Ecf2yVd3dC4XvkNlgfeMdjputOoPRihDgy1HO8fZyxQqP8Oe/jds5eHgMXMbqAM842rstcD6lmGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w1+zZJBlri4rvxPWm2koEXwcCxQbzVPecrYn6sCeH8ABTAyopetEwMwP39ii?=
 =?us-ascii?Q?gSIwBv/3ZBb88nMwRgpJhDI/oKHP9m+GbFcbalNR4+C2ExYwBckrPP/aSY7I?=
 =?us-ascii?Q?Leh94JjnNj4i2RLjF9DvIAbigRM+d+Lo4ctRRc2jx4yQxuhsWNTmkqetUNCc?=
 =?us-ascii?Q?WKd/3TWstvNlFNrLoIady8s5Rfx4fBXiJAlOIQ85X7WmVy+W91bGBNkg2IG0?=
 =?us-ascii?Q?9ZWeW7SBg2HLm3iD0bfLCwlkj7EsUfrOsNXu48n3oYjBN2xy2R+tyFKKqIXc?=
 =?us-ascii?Q?JvZG7NEPQIbWX1arEN73NTjORrQgZrdZiXI0H/ia24+Sgcs39KyW4fdJFixd?=
 =?us-ascii?Q?Hgr0C8fcjkZFK7xV1h+LHimRV8rGwf1pXp2vr9qB8qbUzhXcraNecFOe7hM8?=
 =?us-ascii?Q?V9z+Jfq4RXu+Ol3cTbip7OykRDxhKStuVujEFB/EZqHe6C2aPr3x/iz3jI+q?=
 =?us-ascii?Q?uaJSsw8PsssHftvkenyxkOsnCtzWqNfJUthr6wKc943JFY6nkg/HY1bYL6sz?=
 =?us-ascii?Q?rCdWIsOx6mQkFeACwu9hOwUZatdIANTCRoKVqyLTMJwQzifOWvej3LMLy8VO?=
 =?us-ascii?Q?G8qtafgvw9HLmpCdtk2m3pKylVRshqoQ+qVUSxTAAnZ2vUK9sJ02zkY5CLey?=
 =?us-ascii?Q?BHfU78h2gCPfCuS1vpogXk0UsR8UtG81Hy2t6ylsSPt6qg+Aw4gSeBKSfqMq?=
 =?us-ascii?Q?beF2wsw+mGHTO4rUF/Q+9oGADlSzuD9g3Bdf1M+foTdc9RDozCx+h+JJuK98?=
 =?us-ascii?Q?Gi0z9wcJE90ZZIKbre2zeH5rjgj3OCKPfFR0KFjHYUytJE9j/g0UnQLYiHr+?=
 =?us-ascii?Q?AjY+bP7I7T1+42ubXsJMzJqmIgy1oUD3r+2ECBJJmuG0GZwVDkVKrKTO5KoY?=
 =?us-ascii?Q?GBGqiL+5eMzS95tjNGmRdb2p0gs2nl0nb/Wp9y0y0YKLB0otB5d6wrWhL9yS?=
 =?us-ascii?Q?b0/rQVWWM3Tz8031DgjHU1qBIldwQZg98gA4PvIZJPoEDnzLoebNcQ7xngk7?=
 =?us-ascii?Q?+9A1n98mRQlVnQTcRSdB58vGcMHJERisLsyzQbBk9rggD9oM1r8Y8MjAxZSE?=
 =?us-ascii?Q?hq37byslMjIyE4Hx+f8Th7F4rpBYYcUf+X99hxpVrgTwKtqi17k8El3BLRwo?=
 =?us-ascii?Q?lZDF84twM8sf+Kv9DZmXQ8t+reiEuEBHxBPkyIRuQtEJfwcx01XxAbVZ/cHV?=
 =?us-ascii?Q?oMYX7CdOAlmL09iEAdq6f7wXvATs9keuvA4xWLbHNkFD6k/RNzZfHuq01kcf?=
 =?us-ascii?Q?QwPUtmIIaoJPSs6zc5g/pNgXaOfKp+baPwEdF+DLLh7ItjBH3Q21Mxm1QXaO?=
 =?us-ascii?Q?77EU0bdY4XUonpxTah1hWAaPoCZvyKSg4ABxwv6rOHAE2mSKJx70LuXVtVj2?=
 =?us-ascii?Q?Jxh+/tlj8tjii7Hfwo3iK3Z5lF2H94b+Xdy7AZLg2TjQ+4UyI5qWhKbjHXR2?=
 =?us-ascii?Q?8OIWAA8ADOGwbALnzuTgsXTddN4T58pKh/e6iZqe2Zy3iEShLZOU1KHwpO2W?=
 =?us-ascii?Q?qTdBgvxoeJ0v3KJCZAYSQ8bYQuIe4+A3tVC5R5acWF0sas6BXOCUtR1arrww?=
 =?us-ascii?Q?I8q7S7Jswm8U2Ls7mdo33tNxPPoyc8zfqkf8lNFSpkIr6TjfW8yaJvljhl8k?=
 =?us-ascii?Q?9Y8D9GlaZ8Tw0OUbbQw0NuNTQv3QXenOwI+HqIff8zJ4DprgrALPvO2n95gl?=
 =?us-ascii?Q?Zd/I2VpHkfIZ6QJdv15VW2Shnstr2HwMy5K3adLz7Qzm9iAAkRietPhmEnIh?=
 =?us-ascii?Q?pmVy06gy1NqS9cl/jCpkyIDh0xQq3DuQFKxJED4z5VkdHmedU8UW?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b23b2942-d0dc-402f-b15c-08deed7df9f4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:45.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fP6kAOC2NOLjNcIsxZv1gPO44Gi3dEUuQD7NXTMQmwCzBAjRklwnrmZQK+bb1qRh0ACyUSqY7ADIg0YHWnlOJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

From: Frank Li <Frank.Li@nxp.com>

Move dw_hdma_set_callback_result() next to the descriptor helpers so
linked-list completion and reset code can use it without a forward
declaration.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
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

