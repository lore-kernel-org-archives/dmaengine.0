Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C8470425;
	Wed, 12 Aug 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550271; cv=fail; b=M4QEOGNZmV/H/yUKB7VxrhCojd0qsqqj0PEs1YLbYKK9BQENCb4bLz0/DTUIKu7OtzTDHZslblOW0sOAAzhqTggNOJ7viV3ydVuxfVmNX/tC0gJL4UrperE81GFRsMh15RTwlMEwgQFzE1XAjLWAm3MpcYvzRG9vTFvZ6AV3OM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550271; c=relaxed/simple;
	bh=VKao61kVHOe4DX7U6v7OBspUx6ca4AL/foHEUBq9Ufw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZLF5fZI6xd9HW7wewrgVqgKUeJ5oTq4iS/BG9gaHynVi7BDkCYLZiKin4zT5cUAv3S3QrtMLpeaE6jvVOi1jr6xfTmUUyKsn05unJ2l21UveqBG6zknGgKf3wkKjoJ3rw/68dNW+gRYBgvIjsEIIp/KlS85K0zEJnuOeqgYbsT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=JairWKpS; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="JairWKpS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzZTZEQKkmXSPUst4OKWgLsiEQSjGU3hKzPC6lnVC+2KbHP9RZuer/cvRQtoLqtfCg/v/SPqgegBZQu9KxYVLADVwgO8slmBkEgnA2OPZNsf8eQGw5Km9ABHYb/Urq3dIxb54jrxQ/W81OLySZFt7Q65cUYByoXjhwmk3rPSvzIGe46R93CUAoD0zBCk8SdYqzZeb9N1RQZfg/Fh4vTGgiD/HVP4txhI6tpbBvK/XVU++uQyjy4TZNb8syN7USbX87oOSOwQb9SJuQJ9PJNRIVY8M34lpgi9Wo7IzoG4WxqeJsIWFHfr1Lx+HtMNE+lqr9n3e2XbReQsP9U4fQazNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4UdBxoqEVQxhsj4zqHh7z4Dph1UF1unDV1zV2E2g/Q=;
 b=PES/hWtUMbY/S4Tck5iyRRBsqsbKZHKfpw7MT8X+E2FiYX9Gcj5r3C/hdH8EWGiVO4kjFxlLBwGrLUnpVvy+tbNuMYp5hXJU/j3l6eBjwlgeiRAoWuOwR4OHcWSVyO1YmG5vgCeFbSGL5azSBQrscYx0G9qgRwsJKewNDpbi79E5ZXPvy5ytnCRAuNnfi6vQ4JkquA9yNJ9kesUmo/Pk3LGyP/eMcwJ/SRRpvGriou9D4mc5Tf33d6e+HyurJmBoWh1sDtvstdUy3Wj+no0n4lL8Algr5gksYYn48jOu1PhCzy1iWsUnUxAmXU5pvSgqmZL9xxvrtCeToR9/38fxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4UdBxoqEVQxhsj4zqHh7z4Dph1UF1unDV1zV2E2g/Q=;
 b=JairWKpSpW2tf84CjrSatHZIu0lbxNGI5I4spoG7PtDcVWNb7QWaNt/hbUv54kf8pfMVi7Y5K5Sc3tvHM3CHfGEjzQ+UD5ytgPMkfylDGcOtlzcdlRWiLo1n1l1kUq7nwBX3iR/ZMdSt++qNSWCrdLyTEZc6CkVjDggujcispLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:34 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:34 +0000
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
Subject: [PATCH v5 10/24] dmaengine: dw-edma: Prepare LL kicks for event serialization
Date: Thu, 13 Aug 2026 00:57:07 +0900
Message-ID: <20260812155721.2807506-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: baedf21d-aac1-48ec-391a-08def88a6c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	3xMjAHakW1VjSMGyrN+e/92x1B/vy5ytQ1jI53X8SexAjIv9qhWOad0eyNKEQUmBD3Hew2CyE55WNl0btdjROU8+iakLbm/dLM3FZg5izNRwttHVOitlFK7TirRb4TPXWutUGB153VtyfShwyR8hjoAMogB9KnlA/XtRV0EBWvjZecoo5H+/erroeAE8eMkQgprlDu30/PGmwv1OaGaQcQLR81x17agnAcknhHK8yBY7W8VhI7UtjbIixsSVX2Ud6LrSpd/D565HjkcWX+MMn8xnSHirRvLNFNbB7Eoxtgvy5Fkn3VhAPCcIzMlpYzPUqdBJnNTfqH9ueZ/hMjEcqvP4Bd42XiFBOjJaChz3zp4HCmw7xz8+6PlKdJ342g0r5nuLGZGXx9xA3TJ5dFtF9QK5wUObdYMIZQmIIf/81lanlQGusCjv9x6uXA77b0FRa/BJ9iXBBjRwnMZ9VrHxA2Xrjo5Mcm7DIKIDqVhCY4dhBRUIzGjDsdNDOu4kWcr7k/qAbgEdwlalL/i33ORhr3Ua90Tv+iPjl3SbR89LEKdIe4BXOtCDeYw25sQYV89gQXMIYQodMkQwgTBgh7XWAdSaaPWikYzreEbF3hAz+AbnLKDm33ZbX4LYFe8gfTZAXRP1WOVkQpV5qVlmlLb5ztuzq2gQu0MjvrFBeGMdGne7pOdwVNqipibZF876nEo+jU41X0X+skvA9rjiOMeHCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6BpCEEHcKowjCE3IYxBXyqjPx4Rt3F1gnD6Gi/t3tc2gNE5VTIv8kHkDqfWC?=
 =?us-ascii?Q?p9XD6HA+y2MipPGY12FoFmKBaqM4bwlxG1CQ6NDiPMIkp6JcFu7HR77OHLXi?=
 =?us-ascii?Q?aNPyoYQp6GgurChdYRegdX1PFWrPKsxp8aai+X8y5nqlgG+l776U8jTFOcQv?=
 =?us-ascii?Q?MmdE552iN+C809w2p/7BZ9QeShGDYBPyU9Ls6wZND8qikis+CzauBUgCJEki?=
 =?us-ascii?Q?2tiPGQT+raNs3lCqIkAEp8J+BdChmR1VoUW5siU8zg7MKmtMhEz8PWkf4D38?=
 =?us-ascii?Q?bmN96LwL2Wgspm5p0RarF2KjqUO0FvzG8pr2r6ZQWrri329JFHJkCUbzW5mK?=
 =?us-ascii?Q?9mYnUCHhkYl3CNqPfvptsiYdItYcMy8GzfvVImEyaCW6v4Oi5zG0KJ++e1No?=
 =?us-ascii?Q?ghaMnZgE+PJszUqFDdXRgSXrOfuBwGM/yqWOjrG/0KsejQWO3Brb84U/PUXC?=
 =?us-ascii?Q?RYp2cVszk8MiStTq+0eQWIjg3WGDOVEFYHAflrv1/tn/aGnE6PVakzRkgBQ+?=
 =?us-ascii?Q?ASeMkE5FYWSVwpHCPkCoN8Dpvmao+fZl663H+vAcm4aRFV/zfsCT2PRJs73n?=
 =?us-ascii?Q?XPhRTR5GenWEZloLh6lGXiAtuqIRnyBCLmsXFufcDG/qhc0GCAy1G8B44Q1v?=
 =?us-ascii?Q?e7/kpHB01nMGJxlec5VukaSsCoqfjhyOTN/5hcCfMGrWIoK7cyDRLVxozL/+?=
 =?us-ascii?Q?qFmJwkQ2MjPX1jZ6Q51TlK3+4D2y6C2tF9TgCMCNiz5dZ14qp+rEhulndmxe?=
 =?us-ascii?Q?5F7DiqlIV4kdHl08UEg5pf+UOKPkFumLsTtub8PTslJBtR23hzWeIR51VikW?=
 =?us-ascii?Q?0Anvz73GIYDlXiJdfoB8WoIZggzYYvdOzILQS0tzl9tiNLsM/nDzzvRvLVjY?=
 =?us-ascii?Q?b+8iWB3BaKy46MYqoHzJs4ipba/UrC0C+nZx4LP6MSQ4103VkEd9zEicT27J?=
 =?us-ascii?Q?S25ui2Inl9/cH1VNTbKz4i532yWGD9u1e+RSTu0x9TbtJ6Tb1Drj5Zh2BuCw?=
 =?us-ascii?Q?eglZ96UTqVPesjyXVjgI4vsIyi6BlrfovVJrQRe/aFGJsZDrbCaksuqWR86O?=
 =?us-ascii?Q?VewsRXy8hGlSEW/f1vEIOUh/6GeE0Jt90bun2Cslf2TfWpibXhOVpk9QCdKo?=
 =?us-ascii?Q?5MZMJoq07nAZvtKsyKsiP7ws3hHbVbqfvtIjGGVASLSwDfVfVx0E27laac8r?=
 =?us-ascii?Q?ehAbE3i2rM9RK4ac15995x6skv6qbOPQYD96eB4mnklmVdHpm7UxRezHWLX1?=
 =?us-ascii?Q?ty0l22+2AvPcgeuEDuCL29PsMUahJsgvwXOwm2qbNLrpk69GM5vOJ7Q1J/RN?=
 =?us-ascii?Q?kXl/LoCz4JSrYGzR4vihjTcbN0zOmOnarLY8vGqT3vqPIFBUSkJqWrrqygPt?=
 =?us-ascii?Q?Y509B23fNm+jiPwkN6dVY7BJkPki9DbPecyqxEk4QJg2wN+PGqryVmhFA7oT?=
 =?us-ascii?Q?QKY5p0nvXTGffq0cILE5AB2zVa8qpdnoA8y+wEdLHUyFPQ8/h5M8hY93KtAl?=
 =?us-ascii?Q?q0qMEDHOoHzawT4q4sNSy5J3Vv6iblAoTPD+AhpfBNgWk5Fz/VRAXZV8lSfh?=
 =?us-ascii?Q?yKpCAPUJRN0Eq0UdreM4ZLxMReigByPprhL+IgLPp0ECDLH4r0AAaeK3yNh7?=
 =?us-ascii?Q?dJVZKF0MNoLSJUAr69lSypUAApF26sR9vcjXaxVqkaJxsGt+1KR9QIje+s9/?=
 =?us-ascii?Q?PmaDBU7Zc2IWlULEFmO6U2JcHXVKUfk0L5VWQaDKZiTGTHc0uEefjyNqZodE?=
 =?us-ascii?Q?QWUUOKiiaxXgZ6rji7gy2mu/3cLpSK3JmhVRGGfw/t/AFE2Hho0/?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: baedf21d-aac1-48ec-391a-08def88a6c7a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:34.2801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQ1I0psCg/Vj959qj5UHrP5BUcSyQhGj6HhMnv2aW0YF71EQZGZ1eEbgugLkLVsKlk0xuKp8k5fT+ZvhxWDhzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

Both eDMA and HDMA perform the same remote LL read-back immediately
before writing the doorbell register.

A later patch serializes each raw doorbell write against IRQ event
capture. Keeping the read-back in the provider callback would hold
event_lock across a remote read. Move the common read-back into the
high-level dw_edma_core_ch_doorbell(), where it can run before the
serialized section. Name the provider write wrapper
dw_edma_core_do_ch_doorbell() to distinguish the raw write, and leave
dw_edma_core_ch_maybe_doorbell() to decide whether a kick is needed.

No functional change.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c    | 18 ++++++++++++++++++
 drivers/dma/dw-edma/dw-edma-core.h    |  2 +-
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
 4 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 97de0ad4489a..e2eba6d72b53 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/dma/edma.h>
 #include <linux/dma-mapping.h>
@@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
+{
+	/*
+	 * Remote controller registers and LL memory may be reached through
+	 * different paths. Complete posted LL writes before the doorbell.
+	 */
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		readl(chan->ll_region.vaddr.io);
+}
+
+/* Must be called with vc.lock held for an LL channel. */
+static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
+{
+	dw_edma_core_ll_sync(chan);
+	dw_edma_core_do_ch_doorbell(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 30b508eb3e3d..76fd5a41a707 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -298,7 +298,7 @@ static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
 	chan->dw->core->ll_irq_clear(chan);
 }
 
-static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
+static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
 }
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 4a1bb128fa00..c053cb4c2844 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 		  upper_32_bits(chan->ll_region.paddr));
 }
 
-static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
-{
-	/*
-	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
-	 * configuration registers and application memory are normally accessed
-	 * over different buses. Ensure LL-data reaches the memory before the
-	 * doorbell register is toggled by issuing the dummy-read from the remote
-	 * LL memory in a hope that the MRd TLP will return only after the
-	 * last MWr TLP is completed
-	 */
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		readl(chan->ll_region.vaddr.io);
-}
-
 static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
 
-	dw_edma_v0_sync_ll_data(chan);
-
 	/* Doorbell */
 	SET_RW_32(dw, chan->dir, doorbell,
 		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index c6d7f9885aa8..0b3c8496b0ad 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
 }
 
-static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
-{
-	/*
-	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
-	 * configuration registers and application memory are normally accessed
-	 * over different buses. Ensure LL-data reaches the memory before the
-	 * doorbell register is toggled by issuing the dummy-read from the remote
-	 * LL memory in a hope that the MRd TLP will return only after the
-	 * last MWr TLP is completed
-	 */
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		readl(chan->ll_region.vaddr.io);
-}
-
 static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
 					 struct dw_edma_burst *child)
 {
@@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
 
-	dw_hdma_v0_sync_ll_data(chan);
-
 	/* Doorbell */
 	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
 }
-- 
2.51.0

