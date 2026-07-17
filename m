Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020109.outbound.protection.outlook.com [52.101.229.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920835F5F7;
	Fri, 17 Jul 2026 05:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264626; cv=fail; b=UqvW7QfhdOq20gsXTVZ/qerpNOtQ8ZY9w1IFzFs8tw4wXeW1RQXCNmQIjWbQD4Wz23bef0D5DXcPEHem+h668ue5mdrd8OJ7FcQVVi5xNrerEHGwnR/boBxeNkRl5w8SBYkxbpQvoQSMrcxi02X27B9P7OZyCta994N6cNu9nNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264626; c=relaxed/simple;
	bh=cyQ5KMngmOIxT0Zkc2y1r1UsM8CQaobRg1D0HpjrlRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jDuCh9jxQVQ6yx64syQDIm0n9rmK6bmbZ53ZLaYND2/XJinY0m9zRcLQzaZSWHsheAQVZ0CyHBcg3FO5BwC2zWX17dv9BN6o57Mf7pZNhFF3l7VHDwRjNbhO6qmbwRTRCT/PJMrX5btydTHOQ+XyKQ1ASDUSbNWwD+owNe5vAw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=NVYJji4K; arc=fail smtp.client-ip=52.101.229.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="NVYJji4K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3Tsgiv5CfmQmx6vLsNte+56mTISbodGKwycdhZpuAIe7eyAbowyLGzmmpljPgEaPYNdawppBkTSATpD3j6+u4Vss0HqS7YmwfbIQuJyc4EOAbC12kPtKYI0ljoH0HWcTLbuXO+eG4EsV2REteJIvNx49PQd5SDmDQZkmJkbiY41oOanHv7ec0rjuIq7AIGsY0Z3AmLQtMTyE3sLNfymUROIe8fBn5b/IjQCkV5mk1VvWMCtSy1wSQTp3CvuaRRVFSenfw7AbZOHAVycSdF6LN+nuSpXwI1VlA3iRJB3gpMndGL6Rf9eSHyIolcHVq0+THLWjNlOt3vwPL5A8nwhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVzypddBminPrstceRNaKa7R/1CU1DNw8IfZvvOv5/s=;
 b=CLmS7g1OKoqnF4iXrwvRr+a4bAQjpaPdt3lrKI+oxMLtg0JSs9Z9HwZMBzzQ0GAx5eZGGa09tcTlgfuqBXHbBQ7vw0wFLXU47ZJJ9KUvzT4Kxot0PZqWAjFEUAH4+pTCAHZJbTmOcEXmS4APxtA8pUZLlAhC+gYSMcNCqz4UfgQQz3FSjJs261EsGOMmZiASx/zfiPBqYbIe4mAAY1gwe1+zy5f/cWucLdyznSBP+cGaqd0v83cgSLtTMyYv+vumHudxOPJeVYDTppgBFX83BvCVCtnLGiKGCzpO4V6tZUBrpiHb9N2TiAcd4I+QQQVvq30KTQVUSibjgjXyQrb5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVzypddBminPrstceRNaKa7R/1CU1DNw8IfZvvOv5/s=;
 b=NVYJji4KGGfW5c+9QkrGwDq6RFLWEX0/SP2A70QELTtpqJs9Dy9hvqpBpU3ptaEfDpVGXMAz+ILzEoz09cMnlrb2YYhXetEku+LnDQlfEeMJJL8J/3fGoSR3Jxb0FW2BHu5J2MQ6YGiB8C7cgGyVqS7pIaaL2oIbqJBYnUcvFzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:27 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:27 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/14] dmaengine: dw-edma: Program endpoint function numbers
Date: Fri, 17 Jul 2026 14:03:08 +0900
Message-ID: <20260717050308.2144108-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: db2aac02-ac7c-44b6-0872-08dee3c0bcd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	902ZZbLdSEU+iRvUjjGoP4WA2S3jYRL2fwA/uKXeF8J3J6/WL3UlcSmD9EY9Ix2m1Xelz4WDgLLGoKVc/yA3GfLL2nv5BaHGdPrBtPSIcPVKQpZGB1u1/8kuMh167DYb3Rz1uEGAk01yqKG2k27aHSbTCLAgcqvO8S/4hgLRKvxO/sAMjEi21fBor5Zb+Y5U7kWoOwNp5mhhWEhES5PX8hlpS9DZ4N2PEdOdkbgKznvKN9xG36vJHD3uE52mHTlXqvjkw3IOcutlJIOTPGA73rHfrCY5YRfNUb0r3nadVYT04GzuHRURXqc2NeLNAgbRSkMsfwqIavMoWdfbkSd1yMH44kS4sUIZNeEKAZjTdKPwXxw1Qgo8aqhE1wefsxXsn8KrZIFlDFqbbdrSFdVtsJhpnQbdnVxqbKmT1JEcki55D8T+83H+1yKtIvNw1pSHT7HUg7yoYfFC0LctjUU99olhK69ymgWbDypoyMWJcjw0nciLX10umnj+j+Msbqbn5IufxYP7wgZsFMMh3bykxlyIIcyl60gUMQ3Rn1w9dlyPm8GJJ/ixpZuCscsquXUXyIiT/sN2c3NvxC5i2VOWWr5sZBr8XoKyz82MUahVF+HdYDAvyuhBHFfyUzW6gLIPurbgaB/BDEA1Xe25KEehg1R3Idw9CHNoxvcSTjPCRKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8blzjCz+yKPskCSSfuv0JycH2c72kC2FWQ1i+J4Nmm+7yuRT8Mj25zyRthFC?=
 =?us-ascii?Q?nupw6Tmjq1a7Plj3B9mpnAo6OfKlSjnpQzqcose1cP26rajBtaqaFa98TKwA?=
 =?us-ascii?Q?pGfRtmd4GrO9GAWRklPuryIReg32NHRUhzWGiLxhQitQIrMgIcXwIjsJmnOc?=
 =?us-ascii?Q?xMmM8vJR41IkJZKiqZn5Pfp57b4IryWmH0RuMbtpPtoYtX6V7A49h1SlT+Ey?=
 =?us-ascii?Q?mexjxyuPlAXRW/CxGKycP9Ga2OxJW+8NnqKz1jXZKcnZcX3GDsueeaCywErz?=
 =?us-ascii?Q?ubWz/kTY0A/n2q/lwszm0VH5fUUYalS9GK7ddYqQfsOLob5/4VASit4PkR/Q?=
 =?us-ascii?Q?KFZCLmXokrWwsxp0bSBuQW6neMRZNh8Utobm8EYXgrHuAgF1vqi4oyqqtn80?=
 =?us-ascii?Q?pJLPQhkbEU2+5jtslmt1AHtX8HSJ54NNs+ZV5RNcbTRBBJPTKk4GItRzUx2W?=
 =?us-ascii?Q?pIkx00CORDYkJGqPSGTWWsAw1ynSL/12R4AlZHwAAhTNH8yNsRCzg+Go+23Q?=
 =?us-ascii?Q?e9MPvEDr3OwqOF0VS9UICq7hn4axo17KREc3mHzmLQPhSAcZTx3PQ6OkWgVK?=
 =?us-ascii?Q?FqwVkUrVDO3Fp/s1ZDWQSOD6pTgZiFWrMSXi0CHumSPxpMvQBGlL0YF/P0YW?=
 =?us-ascii?Q?Hq7TwBrM+OynMQ/VUEU1SMZ4E+5LmKXTHU0Bcsv3zYTFN2xfFn5Cq39WwBNj?=
 =?us-ascii?Q?slEPcBnNmObjlnWTRQoMpqxL8kDu0gYIC50A1QbLE0gYSUfj+zOwDqV4vHdU?=
 =?us-ascii?Q?A6aA9WbRvRUECZ8wBfqjP9PwpcjPH2Lz7oKQ/CojX6WBKG0onTIp169TljfD?=
 =?us-ascii?Q?e4/RRjJEb4Nwf3u2fT+UXtKSV7cevAAwEn1J+Zg+Pwo8xn/0a/gfrT8DbJh4?=
 =?us-ascii?Q?1AxTQP83cVU0U6kIKfGXeXyqAk/z/Rs277XnqI/eO3AxztVEI3ibH3athMRr?=
 =?us-ascii?Q?1DjnhXCUg66V9c03VLN/exhXCi+EUinaTz5qk/UIlWSv5fkp+/eSmxUPy2BD?=
 =?us-ascii?Q?uovd0YykOIE/9zN33zJQ8VSR05mkopf4pe452X2bj3gMvWuyhZ36iK1g1jgU?=
 =?us-ascii?Q?avCog68rz5Xucc3C9xwBBsP5N+fPZ1dEPrRlc1w0r2obdBYVacvEgC8mCwWu?=
 =?us-ascii?Q?FWRbs90j73jbMqvDX97DG3yh/1WKJZ74jjwY4I714iZcmxQQ4QYhe9DLGe30?=
 =?us-ascii?Q?dUgOzbj8Jzu2l87zLxotbVXD11oMjJXGjbB/cUFMeLoV7oI4s2OoZ5ZixRdy?=
 =?us-ascii?Q?1G+Igpp/bjY079ovy7DRxnG6M4JghtuW3akNawFntGv+JH8P4Uh3lttDny12?=
 =?us-ascii?Q?H40RTR/6oIy+SuCbGF/x66dds+B5nd4/HgrDOQ/DA1mpURUCLCRkX9ulFnwd?=
 =?us-ascii?Q?5gOvHipdIGc54B5wI4RCbJ96T8Hs3f95ObKzOvyEBXLmzmg+2jUrq9rxdL3/?=
 =?us-ascii?Q?Z2xq8ez8R7QjKJAl+0Dq9CdUVH9zNc+BDNT7RcK6QxAoACtyJzVjHWTIYsT3?=
 =?us-ascii?Q?VGzabphprGQV6iuKQgZc8/rw4GmjhWlfwkWmo4VwQ4MshiktId0smfiOf7S0?=
 =?us-ascii?Q?wlbyUBXmqmNEUBlV2wQFo/3hzUBwJQYtxZ2KsKtCz6sVmDIPZdMvrfpCPlX/?=
 =?us-ascii?Q?AhkuNKY7LIYoZG3jPoVw4WV4N2wEWqipxTDjFc/arxUTsHm4MBi9FxdVvajm?=
 =?us-ascii?Q?eT74VrDjywWvYftACG0vP4Fvt+FZcynkMThFHpKiqcGYa7iyJDDC47ShoWex?=
 =?us-ascii?Q?3KRScd6aRlbHnq859a/wsMpfNR82qbeJIwtn9sDqeWAOgz6zi/Cm?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: db2aac02-ac7c-44b6-0872-08dee3c0bcd7
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:27.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl6ONNiviCJ+ob6bkmYvz4aPRbzfW2tpc7FGSgxHHJLIB/fCDZp0x2nzSQGcsTSg6BCYbPXgMcyNcHnkJOwX8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

The eDMA/HDMA transfers the driver issues carry a requester function
number in their TLPs, but nothing ever programs it: eDMA v0 leaves the
FUNC_NUM field of the channel control word zero and HDMA leaves the
per-channel func_num register at its reset value, so every transfer is
attributed to function 0. That is invisible in single-function setups,
but once the DMA block serves a non-zero endpoint function, its
requests must carry that function's number for the host to attribute
and translate them correctly.

Record the function number in the chip data (PCI_FUNC() of the probing
device for dw-edma-pcie) and program it per channel.

Endpoint-local chip instances keep func_no at 0, so transfers issued by
the endpoint-side driver remain PF0-attributed. Delegated channels are
programmed by the host-side dw-edma-pcie instance when it takes over the
channel, using that instance's PCI_FUNC().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Add Frank's Reviewed-by tag.

 drivers/dma/dw-edma/dw-edma-core.c    |  1 +
 drivers/dma/dw-edma/dw-edma-core.h    |  1 +
 drivers/dma/dw-edma/dw-edma-pcie.c    |  1 +
 drivers/dma/dw-edma/dw-edma-v0-core.c | 10 +++++++++-
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  3 +++
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  1 +
 include/linux/dma/edma.h              |  2 ++
 7 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index cef75da3f2f6..43f8280b5811 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -818,6 +818,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan = &dw->chan[i];
 
 		chan->dw = dw;
+		chan->func_no = chip->func_no;
 
 		if (i < dw->wr_ch_cnt) {
 			chan->id = i;
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 1a9f1b58d2fd..3832e015aee9 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -68,6 +68,7 @@ struct dw_edma_chan {
 	struct dw_edma			*dw;
 	int				id;
 	enum dw_edma_dir		dir;
+	u8				func_no;
 
 	u32				ll_max;
 	struct dw_edma_region		ll_region;	/* Linked list */
diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 7f96e65ee274..07ea237577d5 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -473,6 +473,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 	chip->mf = dma_data->mf;
 	chip->flags = match->chip_flags;
+	chip->func_no = PCI_FUNC(pdev->devfn);
 	chip->nr_irqs = nr_irqs;
 	chip->ops = match->plat_ops;
 	chip->cfg_non_ll = dma_data->cfg_non_ll;
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 3e9512a7b201..fa123fa167f9 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -26,6 +26,8 @@ enum dw_edma_control {
 	DW_EDMA_V0_LLE					= BIT(9),
 };
 
+#define EDMA_V0_FUNC_NUM_MASK				GENMASK(16, 12)
+
 static inline struct dw_edma_v0_regs __iomem *__dw_regs(struct dw_edma *dw)
 {
 	return dw->chip->reg_base;
@@ -160,6 +162,11 @@ static inline u32 readl_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
 #define GET_CH_32(dw, dir, ch, name) \
 	readl_ch(dw, dir, ch, &(__dw_ch_regs(dw, dir, ch)->name))
 
+static u32 dw_edma_v0_func_num(struct dw_edma_chan *chan)
+{
+	return FIELD_PREP(EDMA_V0_FUNC_NUM_MASK, chan->func_no);
+}
+
 /* eDMA management callbacks */
 static void dw_edma_v0_core_ch_power(struct dw_edma *dw,
 				     enum dw_edma_dir dir, u16 id, bool enable)
@@ -464,7 +471,8 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	/* Channel control */
 	SET_CH_32(dw, chan->dir, chan->id, ch_control1,
-		  (DW_EDMA_V0_CCS | DW_EDMA_V0_LLE));
+		  DW_EDMA_V0_CCS | DW_EDMA_V0_LLE |
+		  dw_edma_v0_func_num(chan));
 	/* Linked list */
 	/* llp is not aligned on 64bit -> keep 32bit accesses */
 	SET_CH_32(dw, chan->dir, chan->id, llp.lsb,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 77260c076cd3..fdb2c6fb08e4 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -334,6 +334,9 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
 	/* config MSI data */
 	SET_CH_32(dw, chan->dir, chan->id, msi_msgdata, chan->msi.data);
+	/* Configure the requester function number used by outbound TLPs. */
+	SET_CH_32(dw, chan->dir, chan->id, func_num,
+		  FIELD_PREP(HDMA_V0_FUNC_NUM_PF_MASK, chan->func_no));
 }
 
 static void
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-regs.h b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
index 7759ba9b4850..2bbcc7fabb0a 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-regs.h
+++ b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
@@ -24,6 +24,7 @@
 #define HDMA_V0_CONSUMER_CYCLE_BIT		BIT(0)
 #define HDMA_V0_DOORBELL_START			BIT(0)
 #define HDMA_V0_CH_STATUS_MASK			GENMASK(1, 0)
+#define HDMA_V0_FUNC_NUM_PF_MASK		GENMASK(7, 0)
 
 struct dw_hdma_v0_ch_regs {
 	u32 ch_en;				/* 0x0000 */
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index f827f2dd5299..45f66fc523d7 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -115,6 +115,7 @@ enum dw_edma_ch_irq_mode {
  * @db_irq:		 Virtual IRQ dedicated to interrupt emulation
  * @db_offset:		 Offset from DMA register base
  * @mf:			 DMA register map format
+ * @func_no:		 PCI endpoint function number used by DMA TLPs
  * @dw:			 struct dw_edma that is filled by dw_edma_probe()
  */
 struct dw_edma_chip {
@@ -140,6 +141,7 @@ struct dw_edma_chip {
 	resource_size_t		db_offset;
 
 	enum dw_edma_map_format	mf;
+	u8			func_no;
 
 	struct dw_edma		*dw;
 	bool			cfg_non_ll;
-- 
2.51.0

