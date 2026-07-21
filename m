Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10B9409105;
	Tue, 21 Jul 2026 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615315; cv=fail; b=DbKaZC1BuVxPMjSJHGlNgEkgy7QG3aR0VtgrjKdpAGdChT+zMJokDUJ6L0fMVmok+sI6RScDqnYZ9k9cbENvIkYJaXuYZiVDnRysDzn1rjRSdAsQct6oalL+ZVVRgKybsHNWqNyayxBgZwhztxidBSK/Z4GP0i4eFUc3EA1tfI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615315; c=relaxed/simple;
	bh=P0IjRLIkkekOf+S3uMnTVNjl3KMMOom18wHMWDn6ldk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GIjddaEtWE7pSS6mGI0OmVvAtzEaDiuWLujeF+JwtHtfWSrN4KY6SGDKcntuXAkDnHSz6jOpL/rpP/Ji34I+u9+LEqMkYqABPwex1+UB4ROGUx3AQbb+QLT/XFKkCy0B5HbLLsDzg4HcZr4UABabSnpzSt5YoYVJKXpe+Q0yAvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=fhKsdLcF; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="fhKsdLcF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpjP2Iv4m8SJLhM6JsHTjAY3hFsempLrRk8TQVn2T70fXGCY8BKTOquR5GAbrwNLs2Ydv7kPErhUtUI2RY7ECLnuSrxe+whGNl5FKACDCdVzTIg8C5dS3FK2blRPgLyK9gNGIWbq+vbk0DI0POS6Yl9BTyr2mJp5ws+4m8lcAxHUiD1qzHfhBGSbEhuj920b7gETA8IeQ+lItsMqau/h1sJXmZy+/tdMn8YwwG4lvIib9s2Au0OPI9MuTV8i/ChiTl1rsoYMd8g0/BwRAlSBQPsMD9HWj1Q1tOBzTkvlT70Spb0oEanreK0ldbQbIa6Fl3vn4WZX15/QGonmSAdkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaRA28SdSbjr2kpkh8gphuB4cKNSUlyl0hIJ+TDq1cg=;
 b=jF30hsWZGEclzpBNVLHogQgGeHVQzYfusT+eMxrmAig9D/C1btzlZum1Ka2asB63vJx1JNSTOh8IgfR3mgTTUMziimbab3TRsNXl5Fki7aArMFQoR9ZYdbcOVSNbP3eD2Uywk3+o9w4K8xJQcbGvgTruXXtZrpEgBdZZuFWuoSUUDvIEKGXCnAv2AGC2XBNqelyKaGUv2crLe6xQBUecVYLxni/sgcB5KIlGlRGbcwJ638tRyRQT2Fj6BsklBtH5HIvxFmTHfi8NtLGxf3gHxg5bsNAM0KEuC3X27KVEbxUXPx1scqVp40C0CNHe2d8vN/Cek/GeWq754LCP3988IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaRA28SdSbjr2kpkh8gphuB4cKNSUlyl0hIJ+TDq1cg=;
 b=fhKsdLcF3O4ZkwAJZNpjyMBB21OeSsq29zXdG8F0Sq23qmqGXYzvTdwh46QS3yBWBmw4SuBbpc1UGALatuiVYqAfLyNbWE2KYbVANo7SM5ogARhWo/++ytqlgUBA+b+0p/Q++eGdkujJ6ylY01PvEEbcdIvi9KqrfqguCbTan70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/14] dmaengine: dw-edma: Add partial channel ownership mode
Date: Tue, 21 Jul 2026 15:28:06 +0900
Message-ID: <20260721062815.4117887-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 50714f18-b829-4088-6048-08dee6f142db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4WYkq6Jeo19jyE1+hY3yLyBtPkACqfXLa2u36Vtf5253SEh3C8GXFWipli8jynklbKgpwwIZ1n+oy1gDq7xiITuJ8FWgJYCex6gepj4UTnMItV+/5i9rhHzB2Ql3Su2pM2xylx59Pd5nomplIlRFQ9yM21i0moOAOpaDLrPsb6+pvizYvQUl5v3UZB52BswrPoaPcpyKvJmBsb56m5KLjHlfAogMRoHvU7fG2UNnl3AOjxSZDXhHojsbCogIZqc+XnE1qE4gIMGKouptbUoxZmobVjJyZOsICsrK4YpuXAxOynmgVQz75Zh5qvw7b5ZhT04PO+fqYBGf7wp4CwJLdfa4VdVnGB0aIYtFVLdjsCha/99XUpBmX72S+avVza6MoEuPuMb/Mfc6R1dw7UouRjXqO0G0PHq0aO7KhazMzBHI+f/2/67HAm++Ef8KCBg5L/Hhvb++hMJslEoe8ca1OZbaMTg7piMO8GafbEBZ4LXicnikpHRoh4xtRBqT8r11lpnAloLvRyW9iEBJ6HhgNpS2F0LT4dGdAnqyfL5/rjW69tua9ONuKjKaRJRa6W6kvJIlIHK7rx18jSQgLVK2wVIh5d5mYB+J91KSEqEE+qN/KfJ/dpf6aDiYEnVQzDr+LohRxXY7H/3l491xxSXOSBZhJtsz1bNJTUpsMaxAigU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y3F474kqI1BSSMXREy1Fk2WRWsZSRyUvJbCDXG/MIJMNIVT3+hxy5if583h4?=
 =?us-ascii?Q?psnceR0wu+uLYf0FHMsXLpGKnlMAbfPWccCtbPLKm3JvUZO6LNdbe9BKJikx?=
 =?us-ascii?Q?USZhbRNbv2EYjWfot9aBqmBQfWCID6nsFBe74Sz75uX6QSZ8CC+ZeuAnRPyX?=
 =?us-ascii?Q?q+8NhMDllpesgJa21gaz+QsIG85f5oq9DIUQ6UXyQ8s4b4oiJ3/sni64jyj+?=
 =?us-ascii?Q?Oa1BZ/L/L/qLkNthAorP16fnlCJcBmaNfRmkhxz2w1X9rb5ymQPodXSfpaLz?=
 =?us-ascii?Q?X4822LjT1t+buM3oDp/IK/F0iXH4h1KhaTV+m/kvn2e130bsVXIo+K3svUoU?=
 =?us-ascii?Q?h+A49w6E2EZcGv+D04AoWsbMadGrunJgFqKHRn7S2gjWRrNeIKxLI5ZZx85n?=
 =?us-ascii?Q?qhvw6o9twPHnNenacb6zu2u1BgSzountiPDYkPUOp5KyJTUgoO0hbeYvJWek?=
 =?us-ascii?Q?qyufLLi27YQbj50yQkWr8zL49/l8jveL53LKfuepNT9FiqOkPGFM4KVSb/el?=
 =?us-ascii?Q?uEOlM9jrzsppEB1KePtqvbIASQPtc1i3fUTBlz56NJAv8ZUwol7xYqPEo/Kn?=
 =?us-ascii?Q?BW/npcYRwVVyENgrMgvxj8f+b/C5Vvly9ANb83WV/SUaBG879CcS45xA8pGv?=
 =?us-ascii?Q?wwwFolToOC1UZiuqrdRIdWU1YSOTg7YFEpIw2ATqUP1evjHvdkkYyVb2CpEv?=
 =?us-ascii?Q?Phwv4oR7XV01tIG+D59qIk+DqIY7nUQ1UC/kcqlf5oqx8OtU+EXzIjp5DicE?=
 =?us-ascii?Q?mVMvTMb3Z6sAn667wJPO8/SAdpArCxgEnVahKf/Y837IE5DZ3YQ4BLZ6HhbT?=
 =?us-ascii?Q?hallFOrxHes3TeYk1lPukBX4kGy8yiTuYUarpM1rhc/YhkqUuKm8IGjovaiS?=
 =?us-ascii?Q?yM05/ikMh52XWcHBVu5Ccv07GuLnBUBuwyrUsVsb8a97eyb37SBED5O4uTuu?=
 =?us-ascii?Q?kRMxzeF3HG6Zc9xKBPJZuCF8A1NVkVCw2MTdJlFTgAGN4cGI/PZHCrNKoADp?=
 =?us-ascii?Q?EYXGtezLCEHUbye8mx95UOaYC/R8uPqI0vv8OZefdz2Psg5SP2KOsao53H8d?=
 =?us-ascii?Q?8lTRb95b+LnIIHxc7SNl9dmsNyXyzJHYYltAgqImHjmqZ0Ay7BFpaVI17Ifz?=
 =?us-ascii?Q?H4NTmL7aTmBhg+58Mb9nJ9x8LnIO/ILq9hvPa7cWniMjha5F5Qiw/xuxOu5s?=
 =?us-ascii?Q?ydBZe1/8fzEsL+s2+kgmWGd4pkCQ2pT1c6RuxRaI1dm29mEd2wf5Pk/ivV4+?=
 =?us-ascii?Q?5WoI6kFEEgtnzoJDE4fgbmXd6fXoob/U8+sCm/Wqka19urr8Ue92Nux4QYCE?=
 =?us-ascii?Q?Zem8hsSj/2t+uQZ72LRCUv7qS13Xr9KyiOFq8IUknjt6kPwdeQKU4b9x0ec0?=
 =?us-ascii?Q?ZTriPYlR0U0AIcondmBsoYKSGq5NCnJ+Djh1bbSZLWZRIYcwBov1/YRYqRON?=
 =?us-ascii?Q?qn0nxUh7ABMzvpBUqspmIlWK5KgEhooxBXE0YhwJgwH5FO3ZggN520zUiPwg?=
 =?us-ascii?Q?6R+WvAFxMb5+9QNKeOJxiLLv9Uut7093N7j40Th3R0gPuo/Z+Vx9kg4z0mJF?=
 =?us-ascii?Q?NHhabDhX3q6prNO8nDlLskfH6o3+e9Cpl2A1rwY7Rv6aPE/yAYQFl39AkdtV?=
 =?us-ascii?Q?fm1jpfgcbTIRRE26glfvrzjtLwxzxKZGi3k3u3qUopwnpvhc+pU05YqdyybA?=
 =?us-ascii?Q?Z1CLbeLb0qfMCdDoNxFwI1ng6+Uf7BjxlwTWhTYQ2sV9J9B8kHqZckAz3dJr?=
 =?us-ascii?Q?4YGmtT+a8n06qp2ljTsdToXeG5VV3VYh2DN4u0rqFx/pdRQJorFT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 50714f18-b829-4088-6048-08dee6f142db
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:21.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1P7bo77VzOLKUwd+vKVQqKl/Qjyy3YAkjsif76JVW4o/7Q9RX5hZJ+uzeN9gKorkdooY6kMrSzOK4q/du/CXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

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
Changes in v6:
  - Use the new base's mode-specific channel limits when validating
    partial ownership, preserving 64-channel HDMA support.

 drivers/dma/dw-edma/dw-edma-core.c | 81 +++++++++++++++++++++++++-----
 include/linux/dma/edma.h           |  7 +++
 2 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index ee9a8c32adf4..1a5853531ed9 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -745,6 +745,9 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
 	chip->db_irq = 0;
 	chip->db_offset = ~0;
 
+	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
+		return 0;
+
 	/*
 	 * Only meaningful when the core provides the deassert sequence
 	 * for interrupt emulation.
@@ -1104,10 +1107,33 @@ static int dw_edma_irq_request(struct dw_edma *dw,
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
 	u16 max_wr_cnt;
@@ -1121,6 +1147,17 @@ int dw_edma_probe(struct dw_edma_chip *chip)
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
@@ -1139,13 +1176,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 
 	raw_spin_lock_init(&dw->lock);
 
-	dw->wr_ch_cnt = min_t(u16, chip->ll_wr_cnt,
-			      dw_edma_core_ch_count(dw, EDMA_DIR_WRITE));
-	dw->wr_ch_cnt = min_t(u16, dw->wr_ch_cnt, max_wr_cnt);
+	/*
+	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
+	 * the usable hardware counts separate for partial ownership checks.
+	 */
+	hw_wr_ch_cnt = min(dw_edma_core_ch_count(dw, EDMA_DIR_WRITE),
+			   max_wr_cnt);
+	hw_rd_ch_cnt = min(dw_edma_core_ch_count(dw, EDMA_DIR_READ),
+			   max_rd_cnt);
+
+	err = dw_edma_check_partial(chip, hw_wr_ch_cnt, hw_rd_ch_cnt);
+	if (err)
+		return err;
 
-	dw->rd_ch_cnt = min_t(u16, chip->ll_rd_cnt,
-			      dw_edma_core_ch_count(dw, EDMA_DIR_READ));
-	dw->rd_ch_cnt = min_t(u16, dw->rd_ch_cnt, max_rd_cnt);
+	dw->wr_ch_cnt = min(chip->ll_wr_cnt, hw_wr_ch_cnt);
+	dw->rd_ch_cnt = min(chip->ll_rd_cnt, hw_rd_ch_cnt);
 
 	if (!dw->wr_ch_cnt && !dw->rd_ch_cnt)
 		return -EINVAL;
@@ -1162,8 +1207,18 @@ int dw_edma_probe(struct dw_edma_chip *chip)
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
 
 	/*
 	 * Deferred IRQ works are queued from the hard IRQ handlers, so the
@@ -1213,14 +1268,16 @@ int dw_edma_remove(struct dw_edma_chip *chip)
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
@@ -1240,7 +1297,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 		list_del(&chan->vc.chan.device_node);
 	}
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(dw_edma_remove);
 
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 17cbe7ce55aa..2ce9d2d49aef 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -57,9 +57,16 @@ enum dw_edma_map_format {
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

