Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A0440DB30;
	Thu, 23 Jul 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796143; cv=fail; b=MeMJ7X816wLQh92O/y+Zn55+VbRCLWicgZ1lnjGlRf1r0yY4AzBu+Hnv7gsKlRFeSJQdhil2T3XkLyJlc6Hrcvi7Xaael9+YoYn+fDBavDDri7CLCCAQ5L9n0LTPr8H44KNcXLNu4P0YEGnSmouMP+gG5PLaRIScq5lyJbomaDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796143; c=relaxed/simple;
	bh=dR5CeKiK5haDCUoaeGGA66Su9HbUmpz5HbFsq26i71k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hjUGRd23GpnuDI6cXGBlcWcpJp8jqeAeGGLXhTSvtucxS4HA4BYL+PZTfkj1u6++5ntg0N8fHLRaWJ/jN8tKIQYsqQMJZSN5ZxueKyn1ykcEie+BqdmLCa+dCLCaCQqF5/jQIcr7otsXNVYSzQnkD1GevXA2piyEA+KmWxKDzCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=HcFqIWCP; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="HcFqIWCP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBEgIt+3o7sU0S+oxp8rWBuVfVB4Nad/jaV1myfjZLb6vIc7xK/OpomVlAz9ow+1YCO4sjR+xb7aVnkbYu0+F7sli1wjvD4C6w43HCktY7Co3iCDMkim54BZy0X/zsq05Iafn9ut47f0aMbCycxARySyTCmrsewiwtP1kFDNQd90+hdrV8Hb/zL1sj7g+uNS6l3AfH0PJaQgy6DZPr6Dkn9yRUti8nijnXUFRV7CAJlpADeNhVRLxNVbup8RTEEYNDRvRKEJwAw1z4Oj0xhMee2p6GiUzhwj44EfEwqycPuVQohYYosGkJhK/2sgAqNYUA31MA8WDc3NVZZs1ok+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiR5dM5UWBRRsp67azHTGT0kq6XIWYzKqECfHX25g/8=;
 b=XCxrPkIsuOTANVonOWJpMuwGfqJIJ8Jt6CBxOzMCoajeWzA5FlDdfN0zUaiMxR5WJSEZkIrMAJPqRWuZeeYrjCIx4OjuJDLglgqiwZgCwJLQ+EY5LqPZP+g+N4/v6T10fOEXYPb5Jx3ejC5bhtPRzg5VJ+raq4zfeASyxoJIHQRWFGuDBUO7TdNUiJTveWd9uHbGFgXieXm0yHRFL3mZXIiSzdzOnezpgurs3Qkk5QcI63YcOXz7BdRAV/G6JbRvHi+4/JRgGP1c1YwABEP3W7qV8OvPhVCe3HsyzEhQPpF8WoRs1xZeFt8wCXrywFZ+r4IpiTtrc+Up1xei+ydYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiR5dM5UWBRRsp67azHTGT0kq6XIWYzKqECfHX25g/8=;
 b=HcFqIWCP8QUaKLp7PsAePr9U0/I2j3R6eq2L+dFGSWFyfD5p1x+5l6KkqQzLGaEH1JdoZgLhtSnm4W2Nkr4sWiyFf9ckDy1VivDSxZG9AD5mz3993+jLRGfc+8JIYhgCyMTtwzQQX22mSihjT4GLfE58io14x5kJGstWl1nMwH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:08 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:08 +0000
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
Subject: [PATCH v2 15/19] dmaengine: dw-edma: Add engine reset and enable operations
Date: Thu, 23 Jul 2026 17:41:46 +0900
Message-ID: <20260723084150.521366-16-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d37b0f-bcf9-4a34-9609-08dee8964815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XaR3CndT8r0BL6YqoCRQ5U5eCLw52+Nfdu3YZyN2MWjkAievwy8TYarOG6ROH8E90ssKyCJat0iuoyu+ibJyyF93lQ5lucyVi5CKm5BKfIERalNdsKT5FlfU4PRv4RVr0yYLSbS+fOHqGPo+TLJ8I5wq+lAKXwLrii8bij++N5v3chQwoa9uzcFQ2mpR7xSxX2OYlx7gdOz9wntuRsZUKVKUsNQkfbGgODg8aAwqTJjnLd7SJX7pt76/7Yvyl1f2z6HDsVBjuOyMb+/mqAylBZGVjhSrMzxYKCMpDfgobw5ustNPwXqK0saB7OmQLgmRXDsHwWbTpld2JaDt95073tZpscjm1X5zfkw3gPuHXF3LiNcCuyVzKr4hfmb5w8JbMRzVTb9R0ECxh7pPFPfVALqAVFpVEVo/vFHKo1T2h0qny7bitpf+zVhDQktucDykUZ1d84bGnGH7UbstKE/KDyBAu/a/i5pw0IZXD5py6J1FXKAO4Vu91otSbdMHcT+VHb+Vp8BwcPvX07xHv+thEWSzMs2PR1awwMANUbc5x5EnnO6ZNs/MZF8tLw7yNLgTwlL6ubl16xoBd8F3R2elVSObKSKY/6ooHqiyJPlOv+fqblUjppX+HjG672Pc00mFLMTCh9I8G7FoY2K9sBJ8Yq9qEUgcAmB78n3bBKO5ZRGak1Me/7iL7Px+cVOHruj38GrSOFtc69yA/69/UDlYig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MCkmdJdmoQ+j6uhbU/Y91rk/ZUtC7hhrHlvC2gvbbbzGB7qI8XuRRxnO7IuL?=
 =?us-ascii?Q?px3/TUQ4T+jeYuGG5aquU4MXwV3bqYKdjVTnBRouQrDfeZi0SrQRdK2QCMI7?=
 =?us-ascii?Q?gs/iewU0efHFmHlYudFJRD9XuD6IgtJbxPFGWnFv47LgViuPCwHsZahjU2Io?=
 =?us-ascii?Q?Q4G4JO22CodKcBf2UQHHE9VR3QdC7T0ymRZRWG5yrYWx5V6eXknHux2FblgM?=
 =?us-ascii?Q?PHpOs8t1WrwrQliXP8itPpvm2jUU0OI/YiPOTVbKGajy4wfOs3wlraFid+dp?=
 =?us-ascii?Q?GHNSO5gxV+n2JlT2bCWwydo0COd9PeBGUCoyyWzkXzFgnbjX7GJscIVJ5Zfk?=
 =?us-ascii?Q?vbL8MKIogYT/ONjfsEaeM+hMdI/RmQPTU0IKZXy+/2x7ttluhNffT0nZL2vA?=
 =?us-ascii?Q?7LDyCgJTw8v+Pz8+EhqI3i1JsIuWLYcXZMWm2iozEsfJc91JSEJbRbpckyN1?=
 =?us-ascii?Q?BfkojdfviYAC/GjnysC1kZXlXtC9emN6t0W4YLyl+7McUzAKePIoCBwmm1rh?=
 =?us-ascii?Q?/ME2QO0Vx0cRzcjDMFW+dGomr2ydu+A+p1j+BiMy746YoHsxhnaagnDdEW2i?=
 =?us-ascii?Q?hFZP3ce//EYiBhmcbkp5GuoW7az+9UXiCcdhJV10U94NSr0qd+BfVlWS8ZX5?=
 =?us-ascii?Q?rhi9SBXqE4zmec4hkcNovY924s0mdhnNvHUrV8h3X3KfQzJ9USLlq4+Mo+Iy?=
 =?us-ascii?Q?aJyd/FibvIgZ+L0pA+0NY3pFeuOQPvAcsGp8/KQY931+FlOxYZSNMCVmudKn?=
 =?us-ascii?Q?u17aiRtwmoYhipQvkRejZ/H5EI7ubtG/oB8Ts9i3wTwAVWWw9NeBO27V884P?=
 =?us-ascii?Q?f3Oo37iMRdZa9T+HmozVlxsLcsVN2GnPPy2SHGZJNc985DNbXsUASjhiVQmS?=
 =?us-ascii?Q?kDGfjs92aRCeVp0LKUeXTrJxIKHN1w16uCIbUOFkjCgnybVYEFhgcnxeFfDi?=
 =?us-ascii?Q?9WW7Y2G0ab4nWohqD6e2yLJMcIVNjCSFsiE+a1CfoQaWjQFn2F/HqyxVqvNm?=
 =?us-ascii?Q?iTphjIDzKrs7Jdx+JriGjocH9E9vD/qcO9ohaEW2+O4hriOw7IQZChmwv7Y0?=
 =?us-ascii?Q?tqhK369EY65+dM6EHZIB3y1idAtCfhIyj+yxk+i8MdIhEsWxnGqAJ//3ykju?=
 =?us-ascii?Q?BJENCVDisnSFJAF0kEApdjiyNiyems5JsvTDdies1ny2C5i3AuP8lZGZrzDD?=
 =?us-ascii?Q?f2x/shykC6Z85v7laXFat5BncIJGj05LUY5RjKI5BQjnoXqgAKGChLKb4iG6?=
 =?us-ascii?Q?SPyh8Vg1DsAJHA3hkxIWyh+6ARPeSXEZ7NABJSCwTs246oVu7s/rthIxx2op?=
 =?us-ascii?Q?tixrRqZjgEk5kVwUT+/xtVM9nAL+10xgkGzhxIfr7wpW8FaLZp56w596fn84?=
 =?us-ascii?Q?y19abf2k8xlJIiSwB9eLUQ9UgcyK0H2+kK+2+0/XO2tVAnaMpDB0XEYhp+vm?=
 =?us-ascii?Q?YkFiS5kuTbbQiEXqw6RyP0Y0N6d4Rr5uRZs31CqxpV0qJ41taBLxxkZsNxea?=
 =?us-ascii?Q?k5NFw2CvEYrfqxIg/+ZS2qtoeRuSPj0Eh04V1ZT0hezi0b02fZ+UYmRjPzBz?=
 =?us-ascii?Q?rbiCJu+KYp3+FwdKw+2dHjI3Yx/MWt8cYgqiTZkleqskj/2SzuvY3HzfoLbC?=
 =?us-ascii?Q?GnO3cpXPzfV5e3REPxuUBEq6sIdso8BeSdsBD3QMgtaV0DtbQl7/63xNzu6R?=
 =?us-ascii?Q?7FZimbUzyBKNjg8dY7RBMNfNMpGibKz/4C50balPaMpKAXupVqRRBFsIJ4Dv?=
 =?us-ascii?Q?now2gCVP0n1I6iEmVhTfqaj9hjuPPEKa6uw9KUTK2GtoAfMEux44?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d37b0f-bcf9-4a34-9609-08dee8964815
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:08.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbmMxUTsRGEJbE+myliFiB4x376O4pejR1FiRo2DeTcqmk0aKd/ZNg/b/UdONEdR6qLBMGMGwYD7Xv/JAq0oTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Direction recovery must keep the engine disabled while its configured LL
channel contexts are rebuilt.

Add separate engine_reset and engine_enable operations. For eDMA, reset
clears ENGINE_EN, waits for it to read back zero, then clears latched DONE
and ABORT status. If ENGINE_EN does not clear, dump the state and do not
try to enable it again. A separate enable operation lets the caller
rebuild channel contexts first.

Enable the direction after channel context programming. Keep enable a
no-op in HDMA compatibility mode, which does not expose ENGINE_EN.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.h    |  5 +++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 63 ++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index d235046ccb90..e3b42ad14f78 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -180,6 +180,9 @@ struct dw_edma_core_ops {
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	/* Called with chan->vc.lock held. */
 	bool (*ll_irq)(struct dw_edma_desc *desc, u32 i, u32 free);
+	/* Reset one direction, discard its IRQ status, and leave it disabled. */
+	bool (*engine_reset)(struct dw_edma *dw, enum dw_edma_dir dir);
+	void (*engine_enable)(struct dw_edma *dw, enum dw_edma_dir dir);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -310,6 +313,8 @@ static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
+	if (chan->dw->core->engine_enable)
+		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 42036239ba79..d834ae1633ef 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -220,6 +220,65 @@ static int dw_edma_v0_core_engine_disable(struct dw_edma *dw,
 	return ret;
 }
 
+static void dw_edma_v0_core_engine_dump(struct dw_edma *dw,
+					enum dw_edma_dir dir)
+{
+	u16 cnt = dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	u16 i;
+
+	dev_warn(dw->chip->dev, "%s engine: int_status 0x%08x err_status 0x%08x\n",
+		 dir == EDMA_DIR_WRITE ? "wr" : "rd",
+		 GET_RW_32(dw, dir, int_status),
+		 dir == EDMA_DIR_WRITE ? GET_32(dw, wr_err_status) :
+					 GET_32(dw, rd_err_status.lsb));
+	for (i = 0; i < cnt; i++)
+		dev_warn(dw->chip->dev,
+			 "  ch%u: ch_control1 0x%08x transfer_size 0x%08x llp.lsb 0x%08x\n",
+			 i, GET_CH_32(dw, dir, i, ch_control1),
+			 GET_CH_32(dw, dir, i, transfer_size),
+			 GET_CH_32(dw, dir, i, llp.lsb));
+}
+
+static bool dw_edma_v0_core_engine_reset(struct dw_edma *dw,
+					 enum dw_edma_dir dir)
+{
+	/*
+	 * The databook says clearing ENGINE_EN resets the DMA logic while
+	 * preserving configuration registers, but does not document drain
+	 * semantics. On the tested integration, ENGINE_EN read back as zero
+	 * only after outstanding transactions appeared to drain; the stalled
+	 * channel then resumed after reset.
+	 *
+	 * If ENGINE_EN does not clear, do not re-enable the engine. On the
+	 * tested integration, re-enabling after such a timeout wedged the
+	 * controller and also blocked inbound BAR accesses. Return failure so
+	 * the caller can keep channels gated and retry.
+	 */
+	if (dw_edma_v0_core_engine_disable(dw, dir)) {
+		dw_edma_v0_core_engine_dump(dw, dir);
+		return false;
+	}
+
+	/* Discard interrupt status belonging to the contexts being reset. */
+	SET_RW_32(dw, dir, int_clear,
+		  EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
+	GET_RW_32(dw, dir, int_status);
+
+	return true;
+}
+
+/*
+ * Keep enable separate from reset. Re-enabling can resume a previously
+ * running channel from preserved internal state without a doorbell, so the
+ * caller must rebuild every channel context first.
+ */
+static void dw_edma_v0_core_engine_enable(struct dw_edma *dw,
+					  enum dw_edma_dir dir)
+{
+	if (dw->chip->mf != EDMA_MF_HDMA_COMPAT)
+		SET_RW_32(dw, dir, engine_en, BIT(0));
+}
+
 static int dw_edma_v0_core_dir_off(struct dw_edma *dw, enum dw_edma_dir dir)
 {
 	u16 count, id;
@@ -452,8 +511,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 	unsigned long flags;
 	u32 tmp;
 
-	 /* Enable engine */
-	SET_RW_32(dw, chan->dir, engine_en, BIT(0));
 	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
 		dw_edma_v0_core_ch_power(dw, chan->dir, chan->id, true);
 	/* Interrupt mask/unmask - done, abort */
@@ -703,6 +760,8 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ll_irq = dw_edma_v0_core_ll_irq,
+	.engine_reset = dw_edma_v0_core_engine_reset,
+	.engine_enable = dw_edma_v0_core_engine_enable,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
-- 
2.51.0

