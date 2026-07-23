Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B6640B11A;
	Thu, 23 Jul 2026 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796140; cv=fail; b=Fw+nviDREO2kXtIh/Hw+Eekq/gPYk0COZgTDxjHiVJA7x8FsZXUCbhLSuWNwikTjruDAOZA43+HMgG5r3MYS4yjOn4JPE3VjD6shIIyWxzpoZceAQiU5+6rOabgLFPZFdlCjFp+ZBw4aeooxPOgxaHz5mcR/wv8WDhnhc9xkc2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796140; c=relaxed/simple;
	bh=snAWpscO33puMZip3EV/rzEVd7sZDkL6GpGhGibQQsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BeM0/eiNR/yMQDI0v2kOKCBi29KJnJ5e2WQsWRwht/SkOvjY9tnj53PzgLC0wuSduiZoxAjr5j/RzGshkYF5rHAEGkmmypeU0Xev6MhTJ21fctwG1RybVWRoD7Qj8VA/FEqyxoMTW/adBwj2xeRPIMkYX8uMQoNCK8lIdDHsHyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZscgTBrG; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZscgTBrG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lntK3OP1uPGD4XcLF8SRLiJBSogCvs1LgyEWyB8NgoIo5xlqwIB7vGTbawm8byBIq/w11zPur+5na4wYWAWc8+EZ0Mqq4ioWeU3hozdnIHFdDPqAsrVs/ux/91bGezxw90VgtvYKh6FttnZrpRGFidDV1RNvhUD53GJdT6RTak55lVBt4OxKFiOPDnseYnvBhRKZlPJvZrnenrl6Bg0mb1YKb7bpIwqeu1CFB70yZu5vWnqg+SIrlQLDFIZppX5UkN9BLXCtTz9dGV2nm4zraGd9neE7766SMzu0jJPJFijRkW22pioVN1qndLvhmEy1lEpuWcbBMt7ausnnghZQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uirfCOQjXMH78mMzZxQ2fDDP1ikPapHNzu7PCJnaAS4=;
 b=Zuw9VuJdnAWBD+R4LtnMgmIe0EHxsKBMBR5nb1qyzTNsmM3985ySjAUVknboHIwvYeebSCjXUJ+1ak88ehSMmIyTPbXW7ADtuLtlQEjP0QykYAHhLm4NafofThmdiOAGtVJWLAYpzkI0QASe3pgdwKKWa2xyTMWChYBMnvxwCA9B8Ga3kk74hz5e9ny/DP3IjpwCChVBga9vnkdZnve1c28WDtm1ngmHMQ/Dv0DAuwC9UuRGFJ0nuIyORDYl/5UkmI1jr9U0xzvYh8FbLKlmJi2IIFjyF8+jKTZyjxwaPjS5XGH8NRSWBZFn8FOuHCieMBjhq/hnF48IciX3/e3ZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uirfCOQjXMH78mMzZxQ2fDDP1ikPapHNzu7PCJnaAS4=;
 b=ZscgTBrGmpGDpknExuiIGxFCK9J7c4XBw8jU4Ie5TOfaV3sjIg3gMjWtcqFR03PcOBgTWJBcTWD5HOZp2MHzT7/6aWzOdFXBg6L3GPW8hztT4xZHr+Wtjk8IB83gFyvByILHdTlhfZM+eBWxFxGar7Jpf9cGbipaROLZACQVZxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:07 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:07 +0000
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
Subject: [PATCH v2 13/19] dmaengine: dw-edma: Make the LL ring reset a full channel resync
Date: Thu, 23 Jul 2026 17:41:44 +0900
Message-ID: <20260723084150.521366-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2901e691-c03b-4fab-288d-08dee896472e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8cntadfyuZfe3DB/Lp62FnNpD1Rg1eRweqB9alCYSdnJQH4/JyctS01CXWOI5WLOJ+08DgrhNDzjkncXAYius4Cuetsy4Outm8wQEeqEztNR7IzXdhG89X6o4qbXHvfJd+FWLIe0TkiO5dIFWVomNmcmJtxXfRuYNzPmuT2tGx0KjNquu3jK/8r678Shp/xs8m/yG7K94FljVJ2FxIJUoh/Ih41Z++fo0oYXC7UurzK7GArcK/hTScQvo8S25yfiTdtnmzQqTcXRZynmdaJVMZ18Lt4/V49aeDhsI7TnoWuGamacHaePcucoFReqIcZkaAXOxCrGnnDHiEc4cB27trex09QkVjSny6X7iGqomjh8ICPLpzL1AGVy8shmPEj1a4XzjC+9N0HTWqZMrjmdgCTHem6R2iU4+26qtc0XE+Xh1q0vX/mLdmYSUSREUwSzRKXQpBJ2ob9au61nn/IivwKffrsFCopsG0lcmUQohP4hGZ9dHRFUEhMPMleTcYLDAgzT+/+HdSdKWgmwSKve5hDpH7XmopyPlTQY5X/rWn/g8oV/2OT7nypI/gtYMY7W7xrLFZ7rACUOgebLVdieytW4Sy0Ns70S+U7qslXON2GvGuV10QZe3RVETlSytt/ZY6zLWdJJ4qj82yG8OIYoj3BWhWbijnPddRWV1p51GPIf0NOVwjBCfj3JoYq8Lgfx29hMdh5SU0Iz5XdfSl4EgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J8LnwRfRbJD2yPUxW4uc19++rt0lOIY1v6gueNsDYLK3y7a8l4AAlUAm17Ea?=
 =?us-ascii?Q?pUwG5xj+EA62ZySGj7jtVZYz2zXVzFLxV8EPbxyV5NO51yR1EbLzi/dSgNzu?=
 =?us-ascii?Q?9dGt4t+Re6sb1qLfgZmDaxpkfLgO/+mIz0+b94nGlll5EvhHVSmPA3pV7a7Z?=
 =?us-ascii?Q?LB4TnHdTJQieS6d/1VeV6V4JClHu5wMT4yR+2TKNN9XIZQxPwUncy7yH5r8F?=
 =?us-ascii?Q?hiGlH5CFWafYRMFS2ft7kdx/6ApvLrPHuYnolyBLUI7MNKx8xeniUugRL5FQ?=
 =?us-ascii?Q?wjdGKhJ1QIUCwt4+JshCFwJ0v0oHWnn+0vx4WJ5LjlRHn/k4mgSW/6+3eXhi?=
 =?us-ascii?Q?Uj6WxMRLUpn5RIzTfFB18OnHsJjDM8llizAQ/2bxQbl6TI5STWKmuxjiqSW1?=
 =?us-ascii?Q?3jbWOvJpsN/mdnGY6JXNHHHCMr03F/z8EydV60HCkDrWuGVRzoEiz//tQQV9?=
 =?us-ascii?Q?+s4C8Ru+CBlq2ejPqnL+YaRS3Sswg7RccFabEJsBiwRMWMl0zI7LorkIs8xc?=
 =?us-ascii?Q?2y9OoLpT0SoESnr8RDNSPWFdyKPXI8yTtETszVTi7NsweQeHLWsAPiMC7vCy?=
 =?us-ascii?Q?dN2kGFXDqJjQc4qsZRDkguDasUG+8ghYwE/cRBRo4Ve3GussF8WrEMMAJu3c?=
 =?us-ascii?Q?bwAcrtsMMfUg4IzhILY7xQvJXHHE/nslUYWJ+76+EAXOY2cdkLLAavL79DgF?=
 =?us-ascii?Q?JAwK2KPve4JZiCD2pL2dLlBFFplXqeS/d5G+YkTSPUv785DOzLmKWdz55PvO?=
 =?us-ascii?Q?H9ggW6CHxOrJTGu/hIwhU0nHGpxkeq0NHJPBIE1UzkvMe2Am8PEUwR/gShrE?=
 =?us-ascii?Q?RZykp8zy7iNEwKpm8J1yXHRfYUA8+IHU/xk7cZ05iM3T9H+hoIrAR/z2WqAn?=
 =?us-ascii?Q?ATuCKkou+/DaT7sODlsJSYYN/x8BhnSHbkklWVAMp0ome8ESYdYmHraiZ3+d?=
 =?us-ascii?Q?ewyuoIES/hNXbdWrFZC0cQJUBDTd79E5FS17VfDNzpRv8OWohOpQZXJuri1r?=
 =?us-ascii?Q?A8sFBDC3a9TTI8X1ybZM0QPVxpLemhocNCiqYa36cjiQAL7aEnhI23brjxIS?=
 =?us-ascii?Q?sdlrWvrY2Q1hKihte4uvm+WFe4xvMJIkBvyoxmyreakKdCVWsoN1h8UxGkLm?=
 =?us-ascii?Q?jtBNPOFDnMU1p5o7v9tcwFfy6O/f63CWYKxOpQZaJPgsv80z7Qw+Xr4G5Q8l?=
 =?us-ascii?Q?k1vXmQeoFePhCHRkSLlEfhkYjB32/xkfRGuK/JfzfsxaWuH/t0vYC+YmsSaU?=
 =?us-ascii?Q?Ug2Tmanz1XM+tqxiQCK4Ui0gZa4wLjv+v//w9QMUCG2E4RqDphpVFv9lKql0?=
 =?us-ascii?Q?ujLHAPzTZG39LOkn3ENc32ZTMfJQlfJe6Pl5mBgUSBIqV+r0Xh4ChVL06+FN?=
 =?us-ascii?Q?P8FAqhtQHKkL3PJ4+oPnHVb7EfA16qBUEHjSsMF4XBvMCd5SZMJxwBVH5I6b?=
 =?us-ascii?Q?O50eWCVJ15dtqwXFXJrnSf0y4OhalWb+eI+zoV5OWklW1BwRWF3Lfqfemf+G?=
 =?us-ascii?Q?R5WswgvcOGUAajFExmX0Pi/MpzGqTSZhX+XGc1JzPHU7p5JpqTWAX4jvfvDd?=
 =?us-ascii?Q?s51cTTnk93aVihLY0pokwSetyjZbpkn7YQgc/QzcG833yVA65vMT5W1wwIPs?=
 =?us-ascii?Q?STHhMYWzKB/oL8UfBAai9sUdcbmssEwpGhTAE9XdCb/U7bNaPx3+5nAi394/?=
 =?us-ascii?Q?dJP13ZIdnWuOcVSQWcwyWFxey0O817Asqqz0e6JDyVU1OHEyzk+/bO/HEWKu?=
 =?us-ascii?Q?S+q7rqJyeYF/j3jT6dqBGHWwPeDRZVpD4ASSbhOsF7YmQiGV8YdX?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2901e691-c03b-4fab-288d-08dee896472e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:07.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah396Y1yu358Gr/WjPhbQ9i8ppRH2O45gydRVjU9T9B5OpBvVZpAmkH9kpIfJzNnoL8AM0TP6S08Xreyicx7yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Reset currently clears the ring but leaves issued descriptors unchanged.
A descriptor with published entries is then stranded because LL progress
can no longer account for those entries.

Keep descriptors with no outstanding published entries so their
unpublished work can use the fresh ring. Abort descriptors with
outstanding entries because their consumption is unknown and replay is
unsafe.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 3fc929a6bcf5..963abecdc59e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -100,8 +100,27 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 
 static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
+	struct virt_dma_desc *vd, *tmp;
 	u32 i;
 
+	/*
+	 * Software cannot tell which published entries completed before the
+	 * reset. Replaying one could duplicate a transfer after its target
+	 * changed ownership, while keeping descriptors with uncertain entries
+	 * would block later in-order completions. Abort descriptors with published
+	 * entries; untouched descriptors remain available for republishing.
+	 */
+	list_for_each_entry_safe(vd, tmp, &chan->vc.desc_issued, node) {
+		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
+
+		if (desc->start_burst == desc->done_burst)
+			continue;
+
+		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
+		list_del(&vd->node);
+		vchan_cookie_complete(vd);
+	}
+
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	dw_edma_ll_irq_idx_discard(chan);
-- 
2.51.0

