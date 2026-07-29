Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F124C9572;
	Wed, 29 Jul 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335456; cv=fail; b=pbaj8XveLycV2L/PqU+MP7KTZ/cZrKVOjlVyhgf/CgLI4ZoD+gQYs4CyOdC2OgO5Areevpd/wAGID1nv4HItcgajyMvbmVKfb+vrqUCwv5WWs6GCemkJ9RRlleY19D3uNM+NI15DPzbshEmYSn4MSt+Cf4US7olTxMdc47Ey6Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335456; c=relaxed/simple;
	bh=DK3+L/02c4fPli7PUxS9sh+X5gTeB+s70t+4Fib0Xfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e8kp0NCurUy8sVDtXbHCnnYjWwQ8RaiwsxEFTKU58ZuW08dFgCPH9qk4+qTz77MAkff72DZFY7wLFg9FfwCrzM6WsdHETxc9t2G71dDahwiai4+a+TgbN/PS2fPuMe7Dhq+CChiuVW7QBko3301B+vijM1xSSWcULIFeDN4OM18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=LQ/6YmnX; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="LQ/6YmnX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKtxZWg0SNuaJ7m4RFQdjJNwS3P2ghWFRr2AfuXM3lZ62W6UXl5a/G8thDUjINhuIERj2B9TRZE3pgz/YEu2nfBj5R1VQ6itrDiM9VsizxgYKqJ/d0fAzczDPyukR6LX22JkCXlr64n+hEFhGk1ctnhFm+7cwc9h8HpYtPcldIACmiXdxKJKtQnXP1vyu4ptZCH2KNUSFsoikwqINLh7hh0ptZkSMI6NwCD8ZPYIq9G3Fo743oPNPUHsBGQxA9M3vOCTLlJRh2l4yUIdILXpQuR179ZPDUzBz0Luzuez7vtgqa2PQXMBlhad/FkgruB/Zu96gzRXRo2urBy96DzIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au8f8o4c+e5+0jGTCcHJZvxwDgfqPTIWzxUTkVUwGbU=;
 b=L2rI9qaF7Hlj+bU3TgODcYMVXkvxKU6jqKpobA+a5Pzt0ZHzhdG9QJvfHl6wPd3Wg9wrc21TCgC+setuQhk/MuNvUyjKGOMN4VH+/qcV2DrVBOk29mFXT8dLh4z9fG6ezJVHzAn+hApR3yOVQAqypzt92Z2f4vwICyOJWEwVew5pGHJeqfHE6sjYGD704TrJZKzXPecyqMLyHMNPQdU+llWuk1ZxNSuGua1qTm6ooPC2EPZImshMxl69ucJpFhS0L4LpOPCALy2Hc4G/dBQUpWqzASxzHDaEkS4MR4JaOcyPbBCafS7RkLhmslJLIsuw9PhkHCtO6RSnhDhAA/tbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au8f8o4c+e5+0jGTCcHJZvxwDgfqPTIWzxUTkVUwGbU=;
 b=LQ/6YmnXV2IRC1gy/sHUPi+NORaiD7pLVazWl7gJ2rccJRwEpkQkCEuAMaZpcv6ftJ6j5cuFg9O/ijTM0dh/QqtYytjz/ef6EnsqHTqD3js3s1XuGyI7k1xURUXs9btZpdf3NX+9QdgISyP3eXMDS5WTrX7Yu6aM5G7ydYTw3Ww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:47 +0000
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
Subject: [PATCH v4 07/24] dmaengine: dw-edma: Centralize LL doorbell decisions
Date: Wed, 29 Jul 2026 23:30:19 +0900
Message-ID: <20260729143036.3087722-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: b345d18f-9437-4acf-cd6f-08deed7dfaf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	81pwgSbh+giQlnp5tGzoovZpRKEm69xQffMS4+qTf7nY/HB05mA81xYT5MvqQSSZA0L63QiZ6d05jjvl/CtZNtWWYfGUkQTD4BSdvG3fgMNB7OeKrTJUtZicBp0ESJrO60mwX+v5yShz6ZWKVcLht/oKveZz9euXmSX9+lH8Kxnn0IU5svw94IRuWOlVs6W335+pPol9SbP4TMEObuArT6TS7b5U6tn8F4aQXevq4bL3DymC0TBjZIXhkKSm8bGV6c8Bqfvn5+UEJYLa+zZ6no2h1UMV3K0KkHZTt0dcgNpa8H9foqVqbby5CWXsDrCfT4J2JogfkBQAWjsjYOOIEcOclCauuc2gMuaB0/tS7K6AfWyaWrPxz1cqnFX/PHX3qKBuJF2SgwBo1giUpCHRzuIsrpXtVCVudvY19gLlYydHEDuawAVxZQy0cK/D/5tBWybuSnQk7PfvL1h1PzlckWt94+V1++FYZfSEz/qSfx8SbPZ0/FjlUxPIfXo20XATyB7aAXTx3S2+fjCgMCtNzx8wTXD1tmqgAUK9wzC52c+rtCNIIf18LoHzYb2gPgqrVw3KkCdyZ12YOMS9JJBQ8ygdYh34SfbHsGa2VcY4udgIDabyMCg9yLGPyG/zMBhyQJ8ZjTPDLO5k5QJ4N/pn3Fj7nBzFJq1JwUEeDNf2xjybBCwom0dXdfsPWaJvZahSBX0SuNhY+kLXzYnBfdaRYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ksc9Q2/nkjaxQHwNA3O7aPNTFiZjoyYSGJFIutpCnOrOu1JKY07NdhXrn1zl?=
 =?us-ascii?Q?ka9snFzkygNmRF8HJY6ydlp1UbSygiZdqNjRULPaxMpICnGwSQyqwFyMY53w?=
 =?us-ascii?Q?yjFrXNMm/IzSZPySqvTTNRGfpKN+lit92qlj+kNxK66YfUOiGnXfDOVg5tmx?=
 =?us-ascii?Q?Ajpn0Ea0D+0Owt2JjlnaIPwm7PUB2QpZOOf2lg0yPRJXD3Y1dI4k44UtoN8Y?=
 =?us-ascii?Q?FSOgw2wyn++s/kR35IAzhecDwbob/XxA3rt2x+h/eSle1rlC7vgj7cxAAWRX?=
 =?us-ascii?Q?6bzFDSDN+FffdpniY3z7V9qXpyLdSt99TSwruKuup34yBHPAJu0N/FIyPU3c?=
 =?us-ascii?Q?U0tKnUqmnde7GKXqi25YQ288d0RUNOqJoFh2BFg2f9kSrxsyHGQZbzSIzBcd?=
 =?us-ascii?Q?M/ygW81/Zw/V2XMutrn5IO3vkfKpokeFqR3NFMZnmNHz5qQrLWdnXVa8TnST?=
 =?us-ascii?Q?YzlBfKRK6gPGiLO8GmUUabA3wgbGGhrWT/2kR03xLnLQLOV54PaUlm0av1zp?=
 =?us-ascii?Q?bZ58KD1lsKvWBOsYL+ZiXJ5DyMH9Zllh3/fgFso9nAzz+3dA+GSLICGtkAxV?=
 =?us-ascii?Q?9i9M4ijhNQr0kJ8H1uwGnxx+Nb3E63BR6/yEF4JtGNiXFqWNz/vfO8pTfI/k?=
 =?us-ascii?Q?9yIE7Jj5nNgDZNFVwcb7rorZL3eGRvlhT7jPBT7Xi5gE0pnJBkIOcLqZgnlO?=
 =?us-ascii?Q?OosyRKnVu8NmB/NOgHEMaIiPARUQmszL5Xtgtts+8KjX5M5fmmh4+Fr4KiiW?=
 =?us-ascii?Q?O8/efBicYc7Tycgk5hPn6DfV/6yiebu5fZ8/MKsVDMJqRpoOHt1lcPSdhz4A?=
 =?us-ascii?Q?OkaOeiKZKHDlCiwjDEr/FBf0aWjySMxCx/DsouXXqM1CmhfM/mq2/7udM7RG?=
 =?us-ascii?Q?eGTZzODTfCW3W/k1dGAZvI8kxFZmU1KHY3j57sFprp2tB/GOFc3+CDIwCdNU?=
 =?us-ascii?Q?DpLmRGXMgjaXwI3gGZyZhPUQfGFjsZFBvjBXXdkKv0HjVc5yQ1fa4vLiK5AX?=
 =?us-ascii?Q?v8YymaZfU692emtfRLA9MCJAwwZ7NzyAXW2Db3BPk0HPij3ULDPi97e8KPDW?=
 =?us-ascii?Q?AMoRrU7kM38WpLrdgqyc55DrFMYwPnXBFFABkJaDs1S0jKvlxpAogFjN6qK0?=
 =?us-ascii?Q?OfDgEmkM0KEoIWUw7jKDWt/D4lvumDXL1bfUoBi7v81powMPkBTmMjLZ8xKr?=
 =?us-ascii?Q?Qbo0PUyBGwDcKNr22RJxUSpC27UGqfRAsCZInRQ3+xgAzPwr1U2qeHpZbj/w?=
 =?us-ascii?Q?I6m8gyJI+Ia1wRSZZZ0ZC+RkYxAmR+ND0k100Q5yaoW0FqadJCsLRTd0Gbqb?=
 =?us-ascii?Q?GxFW8rasopD3OEI18K3+VPK2pzL4MvspeXqoh1+mmnDYmMMX7mQRk+0I9aX3?=
 =?us-ascii?Q?iX1owRLQYIdml102p9d8B4I15EkBtxEYEOKe5mrmmB3Ge78FvtK/lDlexywO?=
 =?us-ascii?Q?+pwEG9bI/QzxalwHtFMT4gW7313hnZGy4JVu798Bt/raUy5BaIKxvk4VuFGL?=
 =?us-ascii?Q?f6/ZnYI+CE3GiI4tuXFw6uGelY5RzgAo2NMM4/5D15f7Mzjq/aEO/Aduicmq?=
 =?us-ascii?Q?L6L7wAnrfom/QHMGy3BDkZOQ42ut1CSDiMqacra7+yyb2XnMOQEaFCzd5Yxb?=
 =?us-ascii?Q?KRPzgkJbHMNdiFuXW+P52gar+rqJShFZAlBOjgTJQ/ekX8KuAyI9Co4ftSNG?=
 =?us-ascii?Q?KkFrB+xvkSKis8IBCb5GWRF4+7xAa/dXJQVAIrCNrEq3A1tq0HWS7GZz3wsv?=
 =?us-ascii?Q?0ONoqYIJNV1OSzXvcH0sXsBJh20x31hV/Y0tXJPd+yPV7BGIUW6t?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b345d18f-9437-4acf-cd6f-08deed7dfaf7
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:47.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMvXPatOM6R6R2ydjhru/PuUa6okq9Ap796NF9AwAakz1qz7wXVw9yTkzutmLuTqXL31D3Jkn93te2d6T7xNDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

LL fill currently rings the doorbell every time. A running eDMA or HDMA
channel follows entries whose CB matches CCS without another kick. A
channel stopped at a CB mismatch needs one.

Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only
for a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
EDMA_REQ_PAUSE. The BUSY check prevents EDMA_REQ_STOP completion from
restarting terminated work.

issue_pending() still publishes LL entries only from IDLE. A later patch
allows live appends. Non-LL channels are unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b419ff2becf9..c036510dabcb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -167,8 +167,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
-
-	dw_edma_core_ch_doorbell(chan);
 }
 
 static void dw_edma_core_start(struct dw_edma_desc *desc)
@@ -249,6 +247,16 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
+		return;
+
+	dw_edma_core_ch_doorbell(chan);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -374,6 +382,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 
 	return err;
@@ -420,6 +429,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	default:
 		break;
 	}
+	dw_edma_core_ch_maybe_doorbell(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
-- 
2.51.0

