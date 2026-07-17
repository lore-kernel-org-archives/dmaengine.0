Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020138.outbound.protection.outlook.com [52.101.229.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BF37CD20;
	Fri, 17 Jul 2026 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311619; cv=fail; b=DDTiv1LnZAW5/9lR0EbGrEWtB/qwZ8e47VFMVYfx03qMzgXsP1WMFsnVCJdxkxO15UPgacNgEIRAZq6QvqJAAh7L/SlUSUEVzPaQDv1oFqXyEEHPccvzHbpP8NmEY6zlP3vxpqtH+fZWq7ABUvR/bcDcExJ8tOwV7HnJk+sBfF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311619; c=relaxed/simple;
	bh=zHkoPlkj8j0TTaubi9xU6w89s4BlJJ+Gl0BpV28m/dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tsL1V1dO/qmHzCWFBkGub+ewEirQd6cwmVT1ldKJgtM0XHAD/LuJRsFn9UY7bzL1hRNdy5SsiRIwIGv7GL+XiWQ3obmdvTf86x72nfY2R3IlinVHukMp2KkzJ519NBEo3li2mRewYir8MbcJ1IuIgQqb+deAGVATz3pUE2bSHKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=pnSsZ3n0; arc=fail smtp.client-ip=52.101.229.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="pnSsZ3n0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTMsHE7UkGq32YBwNiwkM/FZhXehgknHOjbVAg/P7ClU0ksaC2wHZUFnfKsz9//5wW4o1QOqqrhCCtMwaW2ixQ8pQW/iIXhTg//GIOqK8bf2CAWsssbnwi/92XSAKAaltZkQQZ4oIfhLjRcsU7K6R53X9R5uvIEmUkXV8/zYxvelFmvspFFesEAlPh/VVop88tZc/wjD7A11cEBGmi0TcyBM/59bZ1ghKse/5ctnsijjOMhjZfe3g7UeFCmWJZ0DvdzT6oCiiX3vT0QeCWqa6Sdxj9nq+iOE2QFy6kU09+dAGS3IE5zbKjtkzP3hZLTpzbRS84QvUsch8o+gi8Wv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiJiuhmJwXClONd0irEL/4C58R/OInXzmAZpxm3Gug0=;
 b=UDWlaU/sHecu8VB8ecWvTPPnCy57fy1RSV9dcorRv6ux4sHZkOzWWeFj3KcaUS+/ccXnDGiNoS41BVced0xGFfoNvIazw0T59n0KJJ0L/SB+raJ4v9UMYl+bieDUv1tKy2xQojkii8CErqioLPVNDzpnouRXqt+vEMplo+T8pf1qllO5Tgm8Zf3uFOR0jsXNyEaEyZ8j5zl7Y9rrlSikVw169g0xrLNC+R+y0gJsy1t5Vl6zy+Na2qpIsEkMJfxplxJ1eSV93KcvR/ov9OXR3j7YL8wRltLqLMsi2/ESeXe9KEv0zXNZElSk5jZAVrmJpKUmV7moyR+Lf7UtrW4CSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiJiuhmJwXClONd0irEL/4C58R/OInXzmAZpxm3Gug0=;
 b=pnSsZ3n0fTcGgF9JqkXg1CspNNKhSP5d4d7V5lsKvys/lkMtsqwifL9z0WnTeK3sYU6BJJTrX460WhDdJAa8lZrcS6Y278EXVMXu/fDmzwJKyYKAw1ZGL4lqHAEP6tlFON3GpP65N65Ue1zhC2X4VopuxAWeTw/pAo/mel5bIno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:468::22)
 by TY7P286MB6785.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 18:06:55 +0000
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71]) by OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 18:06:55 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] dmaengine: dw-edma: Snapshot the v0 interrupt status once per handler pass
Date: Sat, 18 Jul 2026 03:06:38 +0900
Message-ID: <20260717180639.2643243-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0370.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::18) To OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:468::22)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOP286MB7730:EE_|TY7P286MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bf7f5b-f87b-4a96-a95d-08dee42e2ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LEHBxJ14CCXuPVr+ZD18lfRDumrVRYeBB6tCV6IH3c5iVypb9XuGENPkf6moObv6JSKaUKgjKEvRQ0FW7qQnjztDNAusp4Rw9ZT+33/fenS+6GGG6QxZC7hasSeCXw6DhgZvV2jek0JP4jEvrH4KKV2ZvYz1dB2dEkJ30GP+2l40Run4YuMMzuMt6Uqz8IoKS6lPOuv188OBSKTyB9wej6F65EEYzMlHlnAkMw6zDWY1ON0okgGh9DoxtrQHCOqC1SOxsX0e3jdYPdXP7Lu/pf32GllNZjkBgo9rEOnvUS3XfZZItxerD/lyY9xuGFhD25ZHH+pHx76CV4xmQONi2x35Kz3OqdJmfVsL0lJsg1LoCaFBfJ6GC/zXWy910QXBPR+yJ75xoki43xK0WcjYicndCxPmw400pr1IHtUvwmxtPi6r70PDBK3qEIvTO7nuRGnAoUEW53qNaq55Q3NlUluAFRhhOqW81KQ/Ct2mw47sQsVpiRV43EjwIzPhXXp/mwBVrez97wssGWXQ2/9l2EWolaxjwuWOw+DZ9/Av0rDeEAuJRVBXv9zPBYzncT6zHamqBEIodkuin70E7MI3wnFqaqfIwyRYx9qacrzkr2sTqd/Gz+6uAi52WWbHE/f/46FQxeUrnR/LKBBhd1WUSyU73NEnIY30mBoeAUZZUi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gQ25OlHugGXgsZ7Y3knUT2NSQX5MGRLDVq7+7nk0401Acxnz1KgtFXiwZSk3?=
 =?us-ascii?Q?atWZl3nvWY55pBUGXBWIggFPx0pRqeKvLzxZ0ayjgxA5N2XH4GgsuXFc9Ype?=
 =?us-ascii?Q?fHkQcEr0+qXaV/ZF1BWbutnXdXkcM3fopoHnCY8Qj09y2LUVDFWHMKOHqmys?=
 =?us-ascii?Q?o8OcNN63DwrTcW/usoqiF2/l5GoivOmWS8rpR+CFWHS/Z6773dTHZbRoltHt?=
 =?us-ascii?Q?1o45HMeIORLX5l3ejs1yNO9UaP0oPL3L53Ts3rS5ik4/sb1xB+Sb+5yaQ0Xf?=
 =?us-ascii?Q?G6Hcov7TVztKNf1PSuclXaXu2eD1XUiC1VyXFI+IVi2VqlLEtoHuiAzudy6v?=
 =?us-ascii?Q?6h+x9oEBJTJPw7/wd9nkN5Lwbw7i/h/lHt67WvGCNWET4PzijgvBLedf/1sC?=
 =?us-ascii?Q?cTBuSubKZrVno8QjQQJ6ldblufcfZFOLOtM/yAyV0P+yDEuDZvwy4YCYSq0q?=
 =?us-ascii?Q?Ae4Yh1W3xPovpqdErtReZ14utcKlf7wvncZErcBqI0+4eYWmAxpLiF5ZlLjO?=
 =?us-ascii?Q?qKt3ZtnZuVNCiMbOU2hRBVytBJxso1ult2Oxznl06TfnbH5M5ohQUtqECODe?=
 =?us-ascii?Q?/595qGy4CYcyGUdnc4K9O/86wg2SKoARFyupkmz1xY6d4FDxKnOoaF2LRvF0?=
 =?us-ascii?Q?WHopF1DuZOYx6Af+4gpbHraX2GZ3CSrez25+22o+gtUIOPi/l2i57HloarzF?=
 =?us-ascii?Q?HCI+Vv71vikZzY1TibrGupbp7Hx5107e+r+qXEFf2wrEdZiTX4wanBJpFHSk?=
 =?us-ascii?Q?+/NDYz+yS9qMjakmVN+o60N+jBkS066YG96OnDP+B3YPSs3s9jzFikAnzs+P?=
 =?us-ascii?Q?qzEGxVvH2372NQh+JgMAnl22ZySYMHuHLfXUmhaws6XBp5xA/h0iazMX1E59?=
 =?us-ascii?Q?OQEM7+3nNkc9kjV2kYp/5MN2g/IQDXj5hHy9sfy8exIpkuqv5hlBP0lGASxx?=
 =?us-ascii?Q?I3FZJXitZTNLYIw6zRffBu8lZutgoVlUrpLoYe1ZVQMZhdOotvSxm06IrdHE?=
 =?us-ascii?Q?rEF2QAV12HqLR+qAD0spCvFSwTfuthRcJfLtKn+4ikY21sR33XdzS5B8pAPE?=
 =?us-ascii?Q?zI1wxVst2M2r2HkU7UZemLJPbffbqwle+4t3iGgnX1DV7FiWBeWQVK1IApZ2?=
 =?us-ascii?Q?AtQiSFmwa2HGJ/QEvIlGjfVJ4JAG2cM5pn9A3T8U4hOUPHmPBva34Rud/Yx3?=
 =?us-ascii?Q?eb9tszgTS7CHPmMhUfv3KClV+uEmhKiNSwJW3etXlLyQ15vUVuticajF/qKq?=
 =?us-ascii?Q?XDi5d8DB1Zbw64ERrMSpbltTajqNtmN3EXDnuxI9GO7JuwD8gfDV2P6F1o4z?=
 =?us-ascii?Q?qn+8108k6iAx9G8BqPWgRwirDTgSn1FfNU/NBc0rSSeEg1eFT31MA772ZYGV?=
 =?us-ascii?Q?4va3lGXrj5Ui/IGAEMuhuMvoRtTEuoYh2L4TTUQaRwHkPAjLZwa/Y4UVXIIX?=
 =?us-ascii?Q?vSykB2SVmUdtdbEKlNJbL1ukqW6eNAubX619VJ8ULwNKGuNVqeJQ1M5mSBHQ?=
 =?us-ascii?Q?6n8xeTUHd9z+JC0+vLV1awg6WHr5BWERz8yJKZhB3jy7auES6SUjiKbwyp6x?=
 =?us-ascii?Q?YOkiHVktkVMhu2/henMFnKEeveee6y2njB5EYDmSxT8GqJnGRL8ljcibP1aa?=
 =?us-ascii?Q?wX4NFrBOi54nfOt79gwbq7hUbz3V029yqjZsO3kjSWfm5r4XM35FwJbSeA6Q?=
 =?us-ascii?Q?/yg9aIfJreBYxjRPMl2ECwyVa6Su7Ro/bAHlwaZq0ZSRrFKeaxQEPbdDOWOm?=
 =?us-ascii?Q?Hxn2T4MJfc0TCP8HtBYtTSuPddkS3yyAOpq4TfWe7hXLbkQcEVwd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bf7f5b-f87b-4a96-a95d-08dee42e2ee3
X-MS-Exchange-CrossTenant-AuthSource: OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:55.1013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJQ9Wh1D6Oetx7hdeh5t/wlTuh6C2R9qBsWbcxUef62Cf4LJStR+SqTaixn8S+ZPZsB2cb02T38Kqdbl2OSOgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6785

The v0 interrupt handler reads the interrupt status register twice per
invocation, once through the DONE accessor and once through the ABORT
accessor, although both fields live in the same 32-bit register. On
remote setups (dw-edma-pcie) each read is a non-posted round trip across
the PCIe link costing on the order of a microsecond, and with one
completion interrupt per element the duplicate adds up. As an example,
profiling the R-Car S4 remote path put the handler at ~7us per
invocation, dominated by such reads.

Read the register once and derive the DONE and ABORT views from the
snapshot. No abort is lost to this because the pass only clears status
bits it observed, so an abort raised after the snapshot keeps its status
and its own interrupt delivery brings it to the next pass. An abort on
an observed channel cannot race the clear either. Software can restart
the halted channel only after abort() runs, and abort() is called after
dw_edma_v0_core_clear_abort_int().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Adapted to the bitmap interrupt masks introduced by commit
    64173b6b7609 ("dmaengine: dw-edma: Enable HDMA 64R/W Channels").

 drivers/dma/dw-edma/dw-edma-v0-core.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 7bb3ec461cce..f1abbbacca5e 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -218,18 +218,6 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 		  FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id)));
 }
 
-static u32 dw_edma_v0_core_status_done_int(struct dw_edma *dw, enum dw_edma_dir dir)
-{
-	return FIELD_GET(EDMA_V0_DONE_INT_MASK,
-			 GET_RW_32(dw, dir, int_status));
-}
-
-static u32 dw_edma_v0_core_status_abort_int(struct dw_edma *dw, enum dw_edma_dir dir)
-{
-	return FIELD_GET(EDMA_V0_ABORT_INT_MASK,
-			 GET_RW_32(dw, dir, int_status));
-}
-
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t done, dw_edma_handler_t abort)
@@ -240,6 +228,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	struct dw_edma_chan *chan;
 	unsigned long off;
 	unsigned long *mask;
+	u32 sts;
 
 	if (dir == EDMA_DIR_WRITE) {
 		total = dw->wr_ch_cnt;
@@ -251,7 +240,17 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		mask = dw_irq->rd_mask;
 	}
 
-	val = dw_edma_v0_core_status_done_int(dw, dir);
+	/*
+	 * DONE and ABORT status share one register, and on remote setups
+	 * every read is a non-posted round trip across the PCIe link. Take
+	 * one snapshot and derive both views from it. An abort raised
+	 * after the snapshot is deferred, not lost: only bits observed in
+	 * the snapshot are ever cleared below, so its status remains set and
+	 * triggers another handler pass.
+	 */
+	sts = GET_RW_32(dw, dir, int_status);
+
+	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
 	val &= *mask;
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
@@ -262,7 +261,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		ret = IRQ_HANDLED;
 	}
 
-	val = dw_edma_v0_core_status_abort_int(dw, dir);
+	val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
 	val &= *mask;
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
-- 
2.51.0

