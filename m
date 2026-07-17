Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020109.outbound.protection.outlook.com [52.101.229.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E232AABC;
	Fri, 17 Jul 2026 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264611; cv=fail; b=g814/T1wAq8/pzHaoanB2vgvkrWz8cnnWMGB9spiP1jGBqXAAamDll2ghFkeS2uWRW7APz77+uXlPaNlW/sVDIEVZ2hySTv84Sv8JiYXmn2ihVfyIe8hCnCtufwjv9hPOxJg5VHb4Oq35vuQfurNYmf5xG+uZpnS7nDMqTKiPsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264611; c=relaxed/simple;
	bh=oJIGdjp7EAXOlQxMBo7w/8vqV6Ga/5W3vX02xu0zArM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sIbWiifTsxokZRHbK9k5oF92D0pydW2ApNqigSog3zlMHyJvQm6OaLuUwJF/TFXE4tWVVDrOslpaEwAKrO6x8ZKvmGectXiylMHmOHaHFwhKxOYijjLjJVwyQmArn6ltvrf5mW3NEkn/QMe3hzKpLrKF9Wv9+s3MoJoII1k9mI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ee9EbYSB; arc=fail smtp.client-ip=52.101.229.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ee9EbYSB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5FVPKBOCfV2pyMaxZCRAF/VDEdv7zZsA9UFndRp3wYiFYjGkywPQXFu+e8eoMaXENZijBCzvhIt6xyngezShJfeLT/XnDGNKjlOYfK1Oriqbkm6xTJSLP+ckN5mrPMQTUesn3eZDgYBymRLAtNO5M/L1YnR7nAHyK2wI/1yQfVR0LiUixJIr/EsyIf1AigxKrZhIkefs1xY6zBfiAYGpF5JTGAqQZZyS6/Gx5KgKCdcoLmWlqm+yV3oPyLcVa3IU/QruNPA2Nnm9MtRBl5lj5XyCfpCdpCtmKQ6Rk/Cjs4DNkeBn6k0EZI06eXjgKcAPRqihiDwKlDYAvcFzcrtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzvQ9eHjScS2ioxxfdmusosS7abacdE48zd922j8BX4=;
 b=LBKcfVlEmAL4onpvif8OPRCMIlURsKtdshGQeuU2a1PLw56MaDlC/c+PWD7oCKJmHcsJNYBnUxqh2upM/Lw37uqPNAByXsCya+SY3fBEmnJtyfOzEJ1exo1Ur2WgpZCgT0XxNHI6oOvtGeehRIdoUOSTJJMv40H7Aze44e0UhKtqAdFfEzK+VKdr+M+5RCOyXguGWkCvndU+TPc3Fn9uEy13+4XI+qtPfZrxvalHP+qVmOAzD7XNLbK4Gdwdy1Il9XW+8+sCtPaKH32YqJRrDPhyNJoW+BvUGhmvaUFMhoJoOggR0zF7hsRih6ItztbYrZvejV5MI4VFU228uFScuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzvQ9eHjScS2ioxxfdmusosS7abacdE48zd922j8BX4=;
 b=ee9EbYSBbJ/ovZ70lEFSDYHYtuO3rXWIEO3LT00XTYrIdK8eYZAvIrDa9oOhattJFkmsAmZFdgOUToRDOyM+fdCUkI8Np9kToQgkyGOlkpBED0AMgITqv0glDE18Tjf6LH/WRKRk4DCEv4HGELfmaNOZgVSzzuN1TvJlojkux44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:19 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/14] dmaengine: dw-edma: Add partial channel ownership mode
Date: Fri, 17 Jul 2026 14:02:59 +0900
Message-ID: <20260717050308.2144108-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 08778325-fb97-44e3-cc90-08dee3c0b7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nkMqlk3d+Z5UU9X+nmSzbw2lA1wksh7e03LMNTpJ0FRg+EMhmUGRkZNDzgazn5AvRVprolFn6T7HnKeo+gCBBmGqwKoVVo9SHG++hSF9EysqLv6mBlO3q2ry2yGCmNYZuunqlF2PBpM5/mJuElPRvHy3pSiFsLNTLP+lv0DckoFOtJMJPK8uXFYgirUzmn1REN4+JdHzc42Re5bBesdYiuW8arPG1rWeWV3JIZkO8+Og1Ygll/L7Y5iihjm4fDNA2RoBkrXxSnSx4sod4kXNE2bVU2pxjuj1it21t18QGHayyz/OrhhMBmx2NfPLS/GLJ3nNEfnfli/PNNtK8ri6vJtDF4k0E2CGuVIEaR24A3Khd27F2U5sJiTU5S0lcK5qUaHTIuHYSE5cit0feR61IpTHHDToxKgc+4GhbsSdtfx3IHMezy1KCw+edjg44PAzGq2EYLTxWvbBnlxhMdSjjgiwWBcv9oYosg9nO7nJ6pciIYCXxrZW7IbP8A6c0R98/rjbsrPVcrBX4j4MGKSvPYqHFVuTuTfplA8DVqkGd7ME4+42gZdiKSaJ3E3VSiaBOTBpEsO0BUWc9557s7Unw3Nl/DomThqxcEEvwuepa5GAQiTitIrKTw7bPxjUHtT7XFZw0Biqc2derFC5z7lL6hGZGOIzMI2ov+dl3M2BRms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z0T4DD/i/zew76yOTYJaggv6sW+1fM5SWkYQ6rBI/qHftu/z7QdXIMVPlgTb?=
 =?us-ascii?Q?FPk3ddo/jVgVPiEaNFBJxsccf3BM/SVlJEX0B7HGz5GYGP7sRi4MYbbrKc2v?=
 =?us-ascii?Q?XRZIYcCsSVXsT+/LKb6PQanmFkYp/P6DKm3ImjaZ6rNNkdp0LlvPgyFkQVAF?=
 =?us-ascii?Q?mfG/oV288G9a72ob7IAJ20QAB5IclztCs55Gvp/VbXQYGV3Y7eCtqr0RTwP2?=
 =?us-ascii?Q?iNn5NTtGCZr0XAsIgeyzI3B8jThm9F8lNBK6c88A+l08LTJCV1VUBjep+xvL?=
 =?us-ascii?Q?4ghUFNYr9F1+4hU5xOBq3SMo+UXD8XVa50rYdMxj5fhlzMcbAqaEF1/654ZR?=
 =?us-ascii?Q?J0+ZX9tHYEmLEFOS8u3gGMiPfYzstOOHimLHK0a1hCvTkUlKjLPcNeRVJune?=
 =?us-ascii?Q?Onv+gkP+m7bfn2tQF1xdjbqFDu8HZUFwPmALkEJlJqgZVmDDf0SIeDaMwC4L?=
 =?us-ascii?Q?msUSH223AadL3CywUbGVpR1eUpMki8xFQdkx1tbnLzzw103xp5TA5KlS8prd?=
 =?us-ascii?Q?nJVTgFn2UrvNR0sKzJTF1MpXJ5JrPw+FMivO3ubztj1RuCAvnCFO//wYKYrH?=
 =?us-ascii?Q?UO1zF7UQH1JrqfocgY3EEvHJNTPjxdmH0UnFHhMhxJnt8Tju/4yixZmXFcjd?=
 =?us-ascii?Q?3XRv3s0PUyj1U7mjZsfsc4l0RGkNJcRo3ATxWEUWfr1sCHigG8s2poNpDVHZ?=
 =?us-ascii?Q?vwe7mWRF7ctuA7klMkUoK0ilIhfyMBV7ZD1HyUWbQCeRKI0mjk2vVexjel2n?=
 =?us-ascii?Q?1P1c1+ZYowu9bZuoe8ESLHW7d9zNYGuVxdDX36bcCvzdHvsRW2LtK6ad9QG4?=
 =?us-ascii?Q?xOWYr1Rc9brCTUPOlqWAtUX9vpqOxP3QIuYj1eakBusMUOQFm2Ggidd8e3Xk?=
 =?us-ascii?Q?jN5Fdxqmjqv6dLb+MSvNoJYdrIq+2mUUjyBOMtuETKt30OyQ98IUcHITFEUl?=
 =?us-ascii?Q?wO6tFj9mzl9VG1sYoJSKvLIOY5L+x3a4gcsUUTUmTCvUphREtBzCJao0jow9?=
 =?us-ascii?Q?rIsx0tbI+mfeAbfhHCY+Q7NhrNdpJ7hBenknhSgnVAyARK8KeqKI+xLBvCBJ?=
 =?us-ascii?Q?i21cChA7Z98JRdiThW5ZfeADmTbsuA6B7p3E0iIbGK8AoI+Y/ubw4LJV68rQ?=
 =?us-ascii?Q?khr62XhfHBX5jtn/NrzTpMcQmmQh7pDHa5U8gX2jzbAespByf157lJiWH3yA?=
 =?us-ascii?Q?x98XeZdO1DN+u8yyMQGdkCKR4esYya9obvowuMlm21M81U6arGc/cMNw9iSQ?=
 =?us-ascii?Q?zlgwSlaU72+0ZkmbFeAqKE7Etw5J+EhgGY0adf6SWYJyTt+WdVzccdCU6Ata?=
 =?us-ascii?Q?CRMAiUAU5n/MMCrKrexiU5m8kwPdzzI5PM5upSL1EjPD3Y5KrJU+vhCDeRQq?=
 =?us-ascii?Q?VPpiD8hhEilBf0k+F0dU97GafIDQdGQIyFIYzUtC7mOiEUqupeU53rsmpq1f?=
 =?us-ascii?Q?CiWY1nrvEBUelLqjI7xWjtH5Hhxk70qWMwdlkz6F/7pp3SiRiiGGiC83fQA4?=
 =?us-ascii?Q?M4sjyS05hGXEEzRzXISrP/kzfNlR5trMG+HrSsAhdvrwfscVNrqu7TPsowi6?=
 =?us-ascii?Q?VHwmjog7g/qEyDdiBfbbEp+9/jufpljCJKdRpjNdKjKvkMUTdRPNxmqNEm1O?=
 =?us-ascii?Q?jt3V66NRN9S8dKSZL+D53prd2BDpWNXRaTztyDKVwqT/r7bN4zpc+a0y7e0I?=
 =?us-ascii?Q?UwtGmgrEapD2oVZzIUp5Ud4FQ2TToqt5eNARz2C64V3Tm6bZk9yX01Vyc4fv?=
 =?us-ascii?Q?47R4pJ2/7uYEW5FDwLp1T4GXHDNQOa2Qy073K2AVUebkEf63Mum8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 08778325-fb97-44e3-cc90-08dee3c0b7dd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:19.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /g+UaG4W69818HB+If1T+xT9/3vh57AKj16P0yaeB6HgWpp7l07qqrtkA9PYqcM32TNnX6Dai4uSi2bO7qT/Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

A DesignWare eDMA instance may represent only a subset of channels that
is also initialized by another OS instance, such as an endpoint-side OS.
Add a partial ownership flag for instances that must preserve
controller-wide state owned by that peer.

In partial ownership mode, dw-edma skips the initial core reset and uses
the limited quiesce path in probe() and remove() instead of the full
core-off path. The flag also makes the driver validate the ownership
granularity required by each register layout before registering
channels.

Probe fails if the limited quiesce cannot stop its resources; remove
reports the error after completing the remaining driver teardown.

Partial instances also skip interrupt-emulation doorbell allocation: the
emulated doorbell is a controller-level resource, and a partial owner
must not claim it on behalf of the whole block.

For EDMA_MF_EDMA_UNROLL and EDMA_MF_HDMA_COMPAT, the driver programs
per-direction registers, such as DMA_{WRITE,READ}_INT_MASK_OFF and
DMA_{WRITE,READ}_INT_CLEAR_OFF. These register layouts have at most
EDMA_MAX_{WR,RD}_CH channels per direction, so the capped hardware
channel count still represents the whole direction. A partial instance
can therefore expose write or read channels only if it owns every
channel in that direction; otherwise two OS instances could update the
same direction-wide registers without a shared locking protocol.

In contrast, HDMA native uses per-channel registers, so it can be owned
at channel granularity.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Use min() for channel count limits. (Frank)
  - Fail probe and report remove errors when partial quiesce fails.
  - Drop Frank's Reviewed-by tag after the quiesce changes.

 drivers/dma/dw-edma/dw-edma-core.c | 81 +++++++++++++++++++++++++-----
 include/linux/dma/edma.h           |  7 +++
 2 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 392981f3b7bb..cef75da3f2f6 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -662,6 +662,9 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
 	chip->db_irq = 0;
 	chip->db_offset = ~0;
 
+	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
+		return 0;
+
 	/*
 	 * Only meaningful when the core provides the deassert sequence
 	 * for interrupt emulation.
@@ -988,10 +991,33 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 	return err;
 }
 
+static int dw_edma_check_partial(struct dw_edma_chip *chip,
+				 u16 hw_wr_ch_cnt, u16 hw_rd_ch_cnt)
+{
+	if (!(chip->flags & DW_EDMA_CHIP_PARTIAL))
+		return 0;
+
+	if (chip->mf != EDMA_MF_EDMA_UNROLL &&
+	    chip->mf != EDMA_MF_HDMA_COMPAT)
+		return 0;
+
+	/*
+	 * Direction-wide registers are shared by all channels in that
+	 * direction, so a direction must have a single owner.
+	 */
+	if ((chip->ll_wr_cnt && chip->ll_wr_cnt != hw_wr_ch_cnt) ||
+	    (chip->ll_rd_cnt && chip->ll_rd_cnt != hw_rd_ch_cnt))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 int dw_edma_probe(struct dw_edma_chip *chip)
 {
 	struct device *dev;
 	struct dw_edma *dw;
+	u16 hw_wr_ch_cnt;
+	u16 hw_rd_ch_cnt;
 	u32 wr_alloc = 0;
 	u32 rd_alloc = 0;
 	int i, err;
@@ -1003,6 +1029,17 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	if (!dev || !chip->ops)
 		return -EINVAL;
 
+	if (chip->flags & DW_EDMA_CHIP_PARTIAL) {
+		switch (chip->mf) {
+		case EDMA_MF_EDMA_UNROLL:
+		case EDMA_MF_HDMA_COMPAT:
+		case EDMA_MF_HDMA_NATIVE:
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
 	dw = devm_kzalloc(dev, sizeof(*dw), GFP_KERNEL);
 	if (!dw)
 		return -ENOMEM;
@@ -1016,13 +1053,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 
 	raw_spin_lock_init(&dw->lock);
 
-	dw->wr_ch_cnt = min_t(u16, chip->ll_wr_cnt,
-			      dw_edma_core_ch_count(dw, EDMA_DIR_WRITE));
-	dw->wr_ch_cnt = min_t(u16, dw->wr_ch_cnt, EDMA_MAX_WR_CH);
+	/*
+	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
+	 * the usable hardware counts separate for partial ownership checks.
+	 */
+	hw_wr_ch_cnt = min(dw_edma_core_ch_count(dw, EDMA_DIR_WRITE),
+			   EDMA_MAX_WR_CH);
+	hw_rd_ch_cnt = min(dw_edma_core_ch_count(dw, EDMA_DIR_READ),
+			   EDMA_MAX_RD_CH);
+
+	err = dw_edma_check_partial(chip, hw_wr_ch_cnt, hw_rd_ch_cnt);
+	if (err)
+		return err;
 
-	dw->rd_ch_cnt = min_t(u16, chip->ll_rd_cnt,
-			      dw_edma_core_ch_count(dw, EDMA_DIR_READ));
-	dw->rd_ch_cnt = min_t(u16, dw->rd_ch_cnt, EDMA_MAX_RD_CH);
+	dw->wr_ch_cnt = min(chip->ll_wr_cnt, hw_wr_ch_cnt);
+	dw->rd_ch_cnt = min(chip->ll_rd_cnt, hw_rd_ch_cnt);
 
 	if (!dw->wr_ch_cnt && !dw->rd_ch_cnt)
 		return -EINVAL;
@@ -1039,8 +1084,18 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	snprintf(dw->name, sizeof(dw->name), "dw-edma-core:%s",
 		 dev_name(chip->dev));
 
-	/* Disable eDMA, only to establish the ideal initial conditions */
-	dw_edma_core_off(dw);
+	if (chip->flags & DW_EDMA_CHIP_PARTIAL) {
+		/*
+		 * Do not reset the shared controller, but drain stale state
+		 * from resources represented by this instance.
+		 */
+		err = dw_edma_core_quiesce(dw);
+		if (err)
+			return err;
+	} else {
+		/* Disable eDMA only when this instance owns the controller. */
+		dw_edma_core_off(dw);
+	}
 
 	/* Request IRQs */
 	err = dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);
@@ -1078,14 +1133,16 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	struct dw_edma_chan *chan, *_chan;
 	struct device *dev = chip->dev;
 	struct dw_edma *dw = chip->dw;
-	int i;
+	int i, err = 0;
 
 	/* Skip removal if no private data found */
 	if (!dw)
 		return -ENODEV;
 
-	/* Disable eDMA */
-	dw_edma_core_off(dw);
+	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
+		err = dw_edma_core_quiesce(dw);
+	else
+		dw_edma_core_off(dw);
 
 	/* Free irqs */
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
@@ -1100,7 +1157,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 		list_del(&chan->vc.chan.device_node);
 	}
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(dw_edma_remove);
 
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index d29a8df76f8c..f827f2dd5299 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -55,9 +55,16 @@ enum dw_edma_map_format {
 /**
  * enum dw_edma_chip_flags - Flags specific to an eDMA chip
  * @DW_EDMA_CHIP_LOCAL:		eDMA is used locally by an endpoint
+ * @DW_EDMA_CHIP_PARTIAL:	Only channels described by this instance are
+ *				owned by this driver. Controller-wide state
+ *				must be preserved, and layouts with shared
+ *				direction-wide registers must only be shared at
+ *				direction granularity. Layouts with per-channel
+ *				registers may be shared at channel granularity.
  */
 enum dw_edma_chip_flags {
 	DW_EDMA_CHIP_LOCAL	= BIT(0),
+	DW_EDMA_CHIP_PARTIAL	= BIT(1),
 };
 
 /**
-- 
2.51.0

