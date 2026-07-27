Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021110.outbound.protection.outlook.com [40.107.74.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11124399FF;
	Mon, 27 Jul 2026 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171839; cv=fail; b=KlzKYwtDlIPn8rLj/2DIrIUtKTg4yfA0U+iIRhQwZ2iRV8dgXU2n+xt3G5TE0oRmgwtvgXx1sCPUdNUn3iWz7YdDkyULsdCJNfm8n7mH2czpBAhTWSUbVqEVWbaOwemuCTwzMxxG9a7PtUFMzJ6Pz2j98PSycFbaVX2L3UwccPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171839; c=relaxed/simple;
	bh=uYXQ+TgPYLyKpeaT4iQ6BY/6Vy4jlcqSi1RqGvL0m3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZOIKr+XJoEPMvB4v86DLpKMIGQikf6ipGov6jKTuphV7EsbPtziGcrqZGemGd7ZQmMl0TqQiZvhOXeuCm+TvsZmWuqd1laoR2N7ib6szJtvjjriAEnxH4hPHO5pVWJoKpboAVSQ9/Zw7NXn2TtWTMsFvHTqGYXEdzByiWQB7Nc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=cbhfPl8r; arc=fail smtp.client-ip=40.107.74.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="cbhfPl8r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLaTHQktBiSHJMlqXt2UnpfS5cLo19hk27FPD6sp9n3y6BWkFP7z1M79RFaJDhLZ7vilTQkkxluP0ahS8dadtvs6UYUqoNtyQagKTf7rnUqLJm1fJ9HX4xr2+ATrx3dfyo5TTAWQfeYQltVib43i3RlRZwStv+HaOnjv0sl1PMif5JHRGb6YcpLcsmzyBy7xYO2ebWM0uMGoOyDvqNcn8M+qJGh3Mezb7xUCgNPt9ao9yqq18lGAA2jLWXpXfdrEJaRwX4EGZycLAiIsHwHmWu+mTMadDebuaov+wuNIz4czSonHHqitxLknEW80MRUG5IMiMEPF0b1L/fzSM1h7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oTiXnRx4GxBphnBKvtAiojTwOv3LgpDBrsDRwF40RU=;
 b=zH7w14l8YdgyNqXonlTfSbxWvR9yDdqTC2LX70TKEdZjY8GCEg4rhv6ZFeemJh/VvoDzyqJhbPhQAoe5BqCE1YcXhMU3qEnQJtH3W+/+ARJK1ssLG2lswl5n1NJGxx5U4C0IhLVjjZrzX58i0aWkn/0lEumbXHT1fVh7ZY21QMIwDyVqwdZAsKNQ0HHvb+t1j+GmzZPPLe2iAV3LuP13cHwgDc5StBUkwh8T7fZliffi7F4ee/39Qn09fE3Iy0m88d0nR7UQn3Vy7qrMmpXipMVp9tlpZKlPhdo6RhT2dCTR/QCDlihqFihgBBv6OcNv3eq7ikYGhg1jvPZOlNAN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oTiXnRx4GxBphnBKvtAiojTwOv3LgpDBrsDRwF40RU=;
 b=cbhfPl8rPVDLHYMrrNw2TFOZpO0I9ey6+0PTRMEJgbNeOZ5IwfHmAAUXH/yQAAAy0iuOmfe7714qcfc6AM5b/fGk5sCNit3ac4egIxglf0Dhy6KOkImC3UsoQk3b6ja77zzwNxEO7DDA2JceDivsWG+nt3k1Cwm5jZouKGGLGvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:48 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:48 +0000
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
Subject: [PATCH v3 21/24] dmaengine: dw-edma: Add engine reset and enable operations
Date: Tue, 28 Jul 2026 02:03:20 +0900
Message-ID: <20260727170323.2321369-22-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: ec265bed-7224-4ad8-502d-08deec0106da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uk6ysAlMuVgcAhw78dsvEIdMbw5XVtZCyfz5rcWXCXqqnigD8faJSSqwseIQe4gp/y41EWlaHDIvL40RMD4axMEiXxkZP4MetMyuY7hofXZ6h9iEM/n4Ic+LKQQJmsU1VPwWMeuyQ9P8zR9eK73swfflq1e0vAyEpuy5jcy1Gjt2rGd1gJjKE5OnpQ9txNyNOWc6wxerWHU33dPC/oHXGGfUPp3kHDXaA9D00R5WPw/jMLAS8+G8AhsxfJhr79REYHppNlNf8qeflTWcoX5sdUEmnYSlw8mqP0u/yvcn02fnutaalqwcADkXTxWEVi8tmYqZSL/OcassXGM/QT1Jijbk+vCu9hwjjTMX72PEAGlVltrup8oWRS1Nw9/rmpUdkEuQPzywSeLnD3Vdr0Lw7etlcabZh1ZcNhaAGvQbMkzWPUy0d4vU+/AVMzPQ+HWkYPDUlA9h12tOY076aP9Uf2o4bDNBMbGwgUimMkyItI+WQWezvgxSA9pqB5cR6+gkwK1VPPeEZpunr8AmMzJ/rC7XacecrTmBTmiKk3zOrB0LBQKu7+kXFtzSr90CkT00DpSR83WNIipoa5R9SPqEH6Oe2t0InlzbZWGssO/SdJXBhMUbSoPhlYaSWZqk57EV/2bDF8uXF1JBeCndVmGt/y3QKo9ILs7RCc6KkMFDcAjQHutICgvQWxFksXYTEpRlLKPqS5Lu2lF8a/3I/UVcFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DULF5wUJkijdXEbNbOubmFy09KdssK269pb156VAQBDCMdNEmX0DON0JYFew?=
 =?us-ascii?Q?MxhAa5hT+e+rE+rGeKk45UOk0sMUv1E+Sf/6A60g0pv6kZ8So9N3kwSXO9qF?=
 =?us-ascii?Q?Z67xq0+H5aegvORtpYmT+rZk0D5O8kr9NmX+jZcQlMBlwgkr5EkLf8UuhFIt?=
 =?us-ascii?Q?AcHP3tfwVxYUSuXTs7C4yH16NN2pdcKtx/uchMtDqXHhT+O4YF6O/AiLHgPX?=
 =?us-ascii?Q?3Ygd8Xo1eALb5erAYrLUU902aUsuZhWOh9oz4RBH2VXND4GH7EPxqQrSQ2bZ?=
 =?us-ascii?Q?1uMYu+i3B2vusqcaS+8pupcr2adDwzRLkFe4o4Tz/sntjuA12pWoCjeCFjTE?=
 =?us-ascii?Q?VXNAes3hYuXOObtXegiSIC2pAOrFcKS4JYKcnd4fkEZr862q1UFNCHN9Lavn?=
 =?us-ascii?Q?dJBkDXgq6NqNGxFjp+acE6mlSVODQPTevMJavQSuF+I74r4eaxaUd8HBmDaX?=
 =?us-ascii?Q?K9D4x9bd24eIxRGnXVo6ztsogjky3kofnGjAIsDa85uiZv5byEIFD0yuY7Qc?=
 =?us-ascii?Q?W7MjErJy96aKvpJrpS6B+zPbJJtB8SlKTbgxFI40SOln0fH3xtE8ZQcsK8c/?=
 =?us-ascii?Q?OLuCQR6c09ixHoUhq72LQouDl5Nuw5K1hKrNV2sgxQNDcJ4y2T6vtAmNvPgN?=
 =?us-ascii?Q?bJc524SkKGCpSvfA6njHERBgZmMxk+f1stMeX/8SFumgEYs+A6WK15MxHUc2?=
 =?us-ascii?Q?LpCoGzJSIfZHfFcEx7PkCgo3XjdC3WSblPO6Mjkp9+2njHFWxjWeKYkAC9zy?=
 =?us-ascii?Q?7mNNfTz//bfzUM6MpIbMRyVtXf1rbiVMnWjizTsATC/8+TgI9hJNCH+6KWEK?=
 =?us-ascii?Q?mlWQWD8GR9Sj63VwiKpJ3tcjsuGLwGgHrbfiZFFzdXxnK5EAKNq583XCH6/V?=
 =?us-ascii?Q?69uEdirl1tJ64JbTIrmLtI0dgGTVLpCVQLMpNNC+KtCXyR8a2ivwE3GTBTDb?=
 =?us-ascii?Q?fYoB5IPsIDUUTwwfC6orU9Yx0rusW4paTTEaIekUKQEDWiuPhIi4eSog0FW5?=
 =?us-ascii?Q?HmnY98NwDLnyW9ANC08bUKTKhDHcUEHN0b2gHIoyGxz07D3QheNBFHlWstnS?=
 =?us-ascii?Q?W+baVWeMjW/9TV00+U57SbN7pe/q8cSQknNVrmaHreqgTvAJZouabg0Ox/mJ?=
 =?us-ascii?Q?hEi2BExdkZe/42CiC/MN8gIawPcbArMKdmzSP5dsT/NnPR4qe1KgJKoyJj2d?=
 =?us-ascii?Q?pWfkeHHcOCaI9AUg09B5cYS//psMoT2cYVjUJJO/xHiLEh3fEA8sXq9OG2XC?=
 =?us-ascii?Q?kHNOJBJ9r4cS3JDkHGEU3XsTskXtfr/CyVLDKSkNQuEFK4scQEw14BQ0vEcX?=
 =?us-ascii?Q?AQMopkv5FPSC3QNaJ+3q3mT6p0T/dT/pGMGxJKH2K8Ns2KQLPNROY2mWt+Vt?=
 =?us-ascii?Q?M/lSg79Gb85TUbqPIXhsC++KvmoJyqJveAR9RhbRumOWEkgZOFpxLocs+16f?=
 =?us-ascii?Q?ufT3JeUZF1+Zav7eLIhORS4j6RLYfHxTQ+If1GcmJm5tzepSNBUqF8yJhCYD?=
 =?us-ascii?Q?XmXDMou+tQ0fTwnNO5c/SPO+LWncq8PBTeihE1AcDwDeqBOA1TSK1hXzbMPs?=
 =?us-ascii?Q?uKO983OlW4deUr1lnBRoPr/XAfyzp725UUh6cy+pp/AY4VvU9up4iPAqWbCT?=
 =?us-ascii?Q?OX8PIx0MbJ+m4a6PPKcEtxgidCXM8Lx3nSN7Cfi+XLo1AIgdtkUMoba74vs0?=
 =?us-ascii?Q?uEHqNyr70Sc89qNaypFJlhpCb31Wskh1Eedj+2zlWWrCDjZHl/AEmxOLR8hd?=
 =?us-ascii?Q?donVKzgfO+r9G8COeLhtRffgVT+Zb30qB2blw+ceZSUFJV0bZm+S?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ec265bed-7224-4ad8-502d-08deec0106da
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:48.7890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3K4l3DayYv4MvryigM39BgtualB3dBNtoRiGxYLx+2mrvruJqDJowXE956naMHwAn0kh81oAJNyX2N8olIY2ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

Direction recovery must keep the engine disabled while all exposed LL
channel contexts are rebuilt.

Add separate engine_reset and engine_enable operations. For eDMA, reset
clears ENGINE_EN, waits for it to read back zero, then clears latched
DONE and ABORT status. If ENGINE_EN does not clear, dump the state and
do not try to enable it again. A separate enable operation lets the
caller rebuild channel contexts first.

Enable the direction after channel context programming. Reject reset and
keep enable a no-op in HDMA compatibility mode, which does not expose
ENGINE_EN.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Reject engine reset in HDMA compatibility mode instead of accessing
    its unavailable ENGINE_EN register. (Sashiko)
  - Clarify that recovery must rebuild every exposed LL context before
    re-enabling a reset direction.

 drivers/dma/dw-edma/dw-edma-core.h    |  5 ++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 67 ++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f56885747e57..46962a9bb4a6 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -211,6 +211,9 @@ struct dw_edma_core_ops {
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	/* Called with the event scope locked. */
 	void (*ll_irq_clear)(struct dw_edma_chan *chan);
+	/* Reset one direction, clear its IRQ status, and leave it disabled. */
+	bool (*engine_reset)(struct dw_edma *dw, enum dw_edma_dir dir);
+	void (*engine_enable)(struct dw_edma *dw, enum dw_edma_dir dir);
 	/* Called with the event scope locked for an LL channel. */
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
@@ -375,6 +378,8 @@ static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
+	if (chan->dw->core->engine_enable)
+		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 5efeaaaa404e..08d67b4d677e 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -220,6 +220,69 @@ static int dw_edma_v0_core_engine_disable(struct dw_edma *dw,
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
+	/* HDMA compatibility mode does not implement ENGINE_EN. */
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		return false;
+
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
+ * Re-enabling can resume a previously running channel from preserved
+ * internal state without a doorbell, so the caller must rebuild every
+ * channel context first.
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
@@ -458,8 +521,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 	unsigned long flags;
 	u32 tmp;
 
-	 /* Enable engine */
-	SET_RW_32(dw, chan->dir, engine_en, BIT(0));
 	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
 		dw_edma_v0_core_ch_power(dw, chan->dir, chan->id, true);
 	/* Interrupt mask/unmask - done, abort */
@@ -686,6 +747,8 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
+	.engine_reset = dw_edma_v0_core_engine_reset,
+	.engine_enable = dw_edma_v0_core_engine_enable,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
-- 
2.51.0

