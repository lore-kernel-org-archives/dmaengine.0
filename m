Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999646F486;
	Wed, 12 Aug 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550258; cv=fail; b=QxAljWRx+xfENZbMfe5P6lvFk+Wv4dHIs4a33DDaozd2dkAca5aqKI3BR7Ki27WWBnn1vtLZWj3lbjbr6i+JweqaKXWXJ3PjChXzeCnItnanqdcGi4LlasglUpYQo+0xN+8v+ExI2zHQ7vUrS1rnsLeCZV0oHO9u1LoTCUoYwms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550258; c=relaxed/simple;
	bh=WRgGhUaJ9tcTgKDdHOF3WbmTB5P4DlOMs4qgD67i128=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AjKSlUKEWbsZq1lLuR9CIYidmFYl8Vsz8rce0WnHC4wj0Gq19K2RUV39cZavMixAl41E7SdJtiRERoB6PqLoOQdlrwMG6PPkNvMs4UWGb4dlFIpTfl4wvoamANuRntc1M8PgY/QmZ6Lfd6GCA2s2b9Br6rH7hQxeMYaulLBw9uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=uhyKFYZX; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="uhyKFYZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVvblFY/MKgxy1HLSMkMCKoRZVbqZwqacAfrGvaCIXSKsIxAF5IKr6hcRlTNgOHbN8mlUKmDXQNHc9huwgQX7kPaW1MB6ZCMok00jkie1DibRpaS2aEzr1zyw0AZBTooNOTTOgLzcaA4bwc3hBdHHFcDO2ldAUt8BzEZ8WEvgIPmmTPBnFCdhm04Zbw3r+llfBPJEjDBRae4CWKkUcoEaMQSS1aWMs5dJ39waXDmr9+1BtRGXq4QfjT1+Nlc5sBb/rRhzWJZYy/qZ8YLp3VMy8AXZm67AJIagyBG/mqArTJCBB0JywA6HPgVXTSj2qOJZtryXGW0WkUfei6W8MjjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my5jlaExIwIERKEMRvqBwy3Nw9iy0w3XnI4PIiZCu1s=;
 b=x5AYKRMfaB2zx1TkahYjWU93sZ0FiGU3AGPsSyoEtcouYKH4EFbNMrUDgLtPmGyUdsY4TL1ZRfErvUTktaet3ZlQaBJaEwYQiI5GXxyjoIhfUOR6gsqUIm2QXCsXJ9K/q5PYIp9qEwjq26Jf4iPS5FmiRj4bVolY5nRtV7uGF9s+9FsdyY4Xb2Z+J+S4gFfuiwnmEIhsPKyyvOpecuGmrwlM7HHkN3uAh31fsFW4dZVHV+cEwxGWWhuhdDj8gjhWH4JpDz2/uZM0K9Liy89MeyxSd/8PHpDHlzBsR04Y6fdldn7RkzbbAKL5zSOsWZJ55L6lCRo4hhSTWmBFlOXlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my5jlaExIwIERKEMRvqBwy3Nw9iy0w3XnI4PIiZCu1s=;
 b=uhyKFYZXTBDv5E13jtHN66ZxIzQ15ltlg48x8tqUUshEeMALnYiMeW1iUbslcwwF+KrLfRVO1f1w2qsa716hqPEXEv2rCnHrvhiKVIbUa6k82yZ27JLX2kI5Rv6KrX70fqVvgPNe9UHfwk0g2w6B0ZeN/aLdt8c3FdURRwO/zyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:30 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:30 +0000
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
Subject: [PATCH v5 05/24] dmaengine: dw-edma: Move callback result helper before LL helpers
Date: Thu, 13 Aug 2026 00:57:02 +0900
Message-ID: <20260812155721.2807506-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afcd15b-9dfc-4f7a-18d8-08def88a6a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	ByySLXgVEoTzqKPR44oVwaQBNYiom+3Lszpuf9aRoZmp+XK00Zt3w0JO+lKJcgwx/S+Q7NFu6r3lZuk4udwVM70rb1H1/m9o36RlTNvY2PwIJkhqjX5n5j4/L9rsVGkklRQ112FiTWikX4S72fM+B55Ubru4CKhvh6fYJvjtwBzh7uHEi/TDcP/EQUeYqR1SkjflHKHcwWJfTv6WoqdB862MuhsTJlYBwn/1g/ETh5sbXm0A7nVUvVHPsyD6r9yTu1Kj/erDQrxPLPj7ekZspzZg3SsyDn4UTC22RNgGacrdDFHQsrUjOBH3tuH0R9o4Z1X8Ymh3y+ugO1X2A9J96hWMRSlWjWZvsKB0v+tEaDsKubI5s8TfhdHOjFi5cqS3xTRSI75SsoIJj4m1dhFxdUuLH5X5FCKPuOp3LLIY4el39s4b7mRYLiViU+k7gVIe8P0eHvwwK6e72Fi+uikdZguulRXg6cQDp1pTL0dKYM4KYd+/QoiDXw7RG10RmyPV8sKgSwYR5ECD13Ld/YyZpLLdIAKANhFq88Mf15kWXEBYKu7WgqUIv+Ydm8FVN9PayHGvY/o3bP1OLnr/anwSysPpFhgtRshjT13pD4aN7issgVqh3G0mEy4HWstNA/t/nR1elGXwlQZK6oHmAcfnBZmMm0QpxFLJQZ36V2zomJTUrqVlt9u/ZagKmBvmJbLYt88FttTArhvh/k7ysC+dWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NmBoHF10cs/SywYv9gOtj4Qe+F5pr4kMLdxubnVeZtpfW7w8qDA18M94U04T?=
 =?us-ascii?Q?mkT43GRjQ2OC9Kx6Nr/PQgdOVbVJiWRmt+zii0OVojP52p2+hcj+KdeVb7j0?=
 =?us-ascii?Q?TjNn9Nh05hriHpj5TdzLBCgY7cBVs7YyDiPVsn2+UswDjCgSGJed2r0r4Zue?=
 =?us-ascii?Q?5s/EGx7cXvumAi4SBS2PPhPs0GY7oTdOUleYyvnfC79QabWmiPHQX7jM3rpg?=
 =?us-ascii?Q?BR+P7eWHS4umpDnImzKQRrQYkUKLCRc7EXu3lQv2RLT3vwTVruXXmsKvaq8E?=
 =?us-ascii?Q?kHHj5YuxNguViRG1nJ609Hn0LQOU5P7FHnAexdCVuFuqEWw4448oOhfJ/Sq7?=
 =?us-ascii?Q?58LKVq6m9itFzWQjzX1Ta64uSIWjlZehiVpMUFiQbFEo5tn+T+n/J44RvfZU?=
 =?us-ascii?Q?0wSqa0lPET3vB1nbEe2MhwAFqkSiflJgQ6RgA/rCRLgREsfjENh9S8Fah7FR?=
 =?us-ascii?Q?w6xAyXaWth3zc7Od8npyzo47W2dbdSced6Qdz8m5I/vo1e42h2IhKcNTj/aF?=
 =?us-ascii?Q?rYjUZvLoD7Vo0S5SrS6q1MkeRfemSBA2ExqAn7ZY8IPiINIwH/IPV7/QccWg?=
 =?us-ascii?Q?AAvdBrB/2FpRdTumvUQh/R6QteWKnwfmsA/Ma2CzpRi9VN3+F1QCDHSLpEoR?=
 =?us-ascii?Q?56bmmdGL5O7+zuA55NbEslM3j5osGXHUl5mrukswTUDxWr8FV2UTRgDyVRf0?=
 =?us-ascii?Q?FQ8fO3qfuOW0zUzzMLveGqd9QYIPcJohUZoAmj0STc7lQeYTnZ1hROw57qVz?=
 =?us-ascii?Q?R71bCq+Be6gKFsZrP+8vWoVH0thZpb0vOtem+nIQy8i5yABeFSS2ZAdHfIAX?=
 =?us-ascii?Q?hEgL9UR/L7zDyf15sWXMfKtokZ3Bunzu6MbrO9oCZA6m64UyWGYSg/o8bTiz?=
 =?us-ascii?Q?cAL7qwaCbXcAPiXTs5sAWOK034MZ5SITHqrcZP0SD+OhuyVnFWEbsmUxiRTJ?=
 =?us-ascii?Q?0j1P7NAvJl8HTNVHO66bvc9QPpvE7mdM6ejk1CwKvkW6ny7zHS3nkvkQbSNM?=
 =?us-ascii?Q?suLaSV5VneglJDwFVxsDY2gBVHTOUadsJ2Idl9BnAyhypbcCOAQpF1GOMcOW?=
 =?us-ascii?Q?/hf7fLwJttTo/MwZoz98XiZ+Q5NqQqUf+HWzEpuUSstcIbYkjp9ay5JO8bVF?=
 =?us-ascii?Q?thzkJVQziB3tJeFFU4UDO5ZEH73KZeE4cgHEXcg3SqrN86kAB/MYJKr/mKiH?=
 =?us-ascii?Q?AnXGsvLGN3Vlu2/n2b2d8bXH66TaLx7xe6DgM3rxWNAafthiVdGLcg/7W07N?=
 =?us-ascii?Q?/HVB8npX/a4lnU0FifWvjvJrICCXBM9giGtQfxI3e52NwscQmXMaFxkBuuLw?=
 =?us-ascii?Q?Ub4GaqgmjxpOgaqiaKLlY/6G27ZPQer+pWVtLfLes8ScwmOaPxqgiXmb2toD?=
 =?us-ascii?Q?Yujk3jvArWdnCBUEPFGsBr+tX1we7lmnaMTtBMMKtZPcBWpwAzioFhFeUvJK?=
 =?us-ascii?Q?P4O+RyLYcbt91Iuze16Pz+drsMArSilJ9QVFiaZWeTjFGA0VEeQlLgxLUqLQ?=
 =?us-ascii?Q?3OXY8QW10vQhfss+kIb9LkEXJJnRWCiK591neQ2oEZMf4kjjAU06GsoTrAu2?=
 =?us-ascii?Q?b5I9VEZJddKah1D9dVg6jQBLeWwYJBkawL6Bpq+QzONd2A1VwviLPZeSMtqW?=
 =?us-ascii?Q?1hUEIp7nTqPN5Q3+cEBCKcTCB88u8Q7k82JtkPECy2gLeRlE1kORvzb9AVPM?=
 =?us-ascii?Q?YSjzWLewUcQ5OJeH+QB9+op9QpgTiBKkRlbZStg6NVvfCC0opf8aVaa8sRkt?=
 =?us-ascii?Q?1LGthKI30sg3z2N7G0x15ar3s4CBP0ZEIpAKU67bQ7ynBn+oZ0Qe?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afcd15b-9dfc-4f7a-18d8-08def88a6a28
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:30.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GryLg5IzQRHPVv7d7agnH+OctqJe2nN18YYDq5fF5x/2y+3JrTRzvfLWtdOI4vjKbmVm1JaAPXNMUuzBTzlUUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

From: Frank Li <Frank.Li@nxp.com>

Move dw_hdma_set_callback_result() next to the descriptor helpers so
linked-list completion and reset code can use it without a forward
declaration.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1af262b6e881..ab8e343f0196 100644
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

