Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232C7409620;
	Tue, 21 Jul 2026 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615332; cv=fail; b=e3f3r19NMPmYo7uVmLZnNsp4oLB/0x+SITEvzzmctD+VG+mmfgUNbsR+K3fYc184FG110eINHWO6Y45RGCRytjFu+JLzkeIgLwdpQymDH4q8L0IowZ+ZOQL59h/kulvxkvIyhspQvGB3HHvVE1P0e7NFq9/uoyLazVKKsN1fqu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615332; c=relaxed/simple;
	bh=xKTmh5lrxSwvnX8CI4NjB+NkBhsKeJ9x+wKJl3PiWnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ietoZwHQx+I8WqMvLa7LhPIaRGwPtA2eYr18wUIko0yqEPxB03GRKEjPgQIanKWYMrm9tXPazj5bbnUWPL6SeALfnGPlBjkmvuNCFymDjOjtZOhRXh2iWCPjCQlLUhGlWWTMSxVvZaWMFNGf4pODD0h2/gMT/uUusXWmmvYt5h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lOdqp9qt; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lOdqp9qt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRu6YNjOTIagZ48M516uwQ/Hhi1TNcj65lDpdQJlcjEwPQx9UI+NSMsdpLB+wvL7ISdIlvy0LmOnYy39uHUCblcYiPjV+hiJZ7URttUz/i7CPUpzs+jeqUSDIm4CWdVl9D1/AaW3RurDQhhfdqwP2vii1v93N6DOybFnHlumUFpPB/hpfmqEtAJTZA/I3JV9vvZu6rS6+rHMgA6X0mQo5JDs/pvhNlBPR8eUvDGVwVFeh6itsk6WHSkAAktVI69nx4o0jfvDID8SiZ41cD4VyWRptsoOOk8QAzWcaX3Vk2SaqQTaJi6gv9n0/GFCZSUYnrbjkoVX39Y6khv0Zln7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJeJNRpHl6TId3F4DeHZuKChPIWs9Ghwsi6Nu8KgKEM=;
 b=neUtFJkjQ1rsNmLh8k3NyVb81Y+e+RToSgKKkQ2i2h1XlcUTLWTQEjTJyqaEwt0YC9TrVfGbgGXUjuUx+KYwE3gkAoH1EWlYfeCJoMY+l56MP3Ns5HYcGLONWGY3ZWLbYgaVFJT/gWM4Wlb3qJQ0u/+mI9SFb0q+xK1vFL9j6xUb2j6aNlvNFfZdCExmRbxHhwNef5qEpnb+wHDCFtWPfrGT8q3Gp1M4sA5QyeX0kP1M1/q+4s7416LFB8KINhEIDLHFg7uDmnUn6biHHyq38vO5b5wBMKEdPLEnZF6gy2xwJjJxXkprXdwR5FVGH6XgwHjOkj+BwuZHHuAhUeSofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJeJNRpHl6TId3F4DeHZuKChPIWs9Ghwsi6Nu8KgKEM=;
 b=lOdqp9qtZyYRrmtjnwQSgOJePrJ9eIg5zFNWkJoL1VAVGAln0u4gb/PZV+CQYQbmc58Fy75i/YfOHLpAK8TQ23g+W7boLIZSj1tcHyiD3cBhZhLMTq62/D7GNIZ+/8cAdXTr4QuL+s3YV8ucHSkUMhLIdxfb0S0y9CM3KzV9KX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:27 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/14] dmaengine: dw-edma-pcie: Add chip flags to match data
Date: Tue, 21 Jul 2026 15:28:14 +0900
Message-ID: <20260721062815.4117887-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2f6b3b-d437-46d1-dc09-08dee6f14693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JNtpRNVIVvcrkh/KQrV4xU2S+SRQxQr9wSnQY+Z/mhDJGDnvIh9hwm425lqc0L2lThIuwmiye2gq32ql1oA3cEyaz8UHA10e6k+imoOYVGFtxW6wPXZBdb425+eHAJPEnbXekPE5LksgC8vIyzZsA6yRr78Ge85quUHbDqeNW5Fjv5y5hq8kgnveHjYVFfz8MoebwYuNIFoBZNaAT5pvgRb41Ki76AUSB5YXCs+nSIRqfLyOfjS2kqAVzTFLXRZ5rYol6iF+o9zolj6q875F87C2CDrv28osk+MiFV0AA4fOkl13XuefMxWYRDAq9vLTQfKxyn2xq8SiMq2evzLkS2xT+2cqMpxP3Ch3Px10WQV2WwS7Iv/FeAgrlh6bck2NRHLJLg3SOEUCuYtcZ6/A73cUWqEGVceOhxmm4i9gce/Uc+cNVuT3n+G9zN26H++m25VDM8l4KuELzA9Rwx76bYZnGnDo9IzQf6thKSGu7IDPy0gtJKWj9uHH97Mf2mmlFxD/3aDolarG/ENdbXvMgdfLuZ/hl/1/G/msW8+gvBBbU66eScWGVH0s4kVCoe5RdIPlTzZbohnJA8+LpQjecLFqFhNf0y44At6GGtyBOf0GL+hlCHgiicLoPz5xkSADl+uA7ZTRR0Dj7G+baFZ5wxQfYgbO66a5cC/Tp01od4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N7gbFXzF89kIjz/vi6jNIm9xJPdJhvJ34vxwaAAgJdjPxGbn6S2+aCAAJMH9?=
 =?us-ascii?Q?dR1XC31mvP9UU93tbBbYL/2pkTgThkVsL6NmfUawuuHh2woEvslupFEKC0FD?=
 =?us-ascii?Q?yuW23u6/LpvGWCZ2N9q80FqnNGAuqE7lTgT6bf7nIx70sHtHR7t8h2yvFnWk?=
 =?us-ascii?Q?DVcKSsu5RVRyogp7VvfcYimQD/B5WKLN8N+KXoVqtuznAMxRaM1KD6bJQHjm?=
 =?us-ascii?Q?i3VGW/HLAtb4Ve/Ua7vebilNGSaaVDKTboOTra1eXnKJMO3BPXIoycZLSf8w?=
 =?us-ascii?Q?1d8L/Bjz0MpKZ9Qxfw/Vr/qeFVvqAlcjtNq8MahluRy5q1Na9dXh5IHIMkXN?=
 =?us-ascii?Q?ayeXoGcVy2Op+pXJfnv1g2eJj/ODB4PE87EpFAGMSWkvcDUaCJ4SgN4E9fCZ?=
 =?us-ascii?Q?12MQB68h4CDNxV5eumGZy0k6WUSYPURg5r0NiQsjiGRRshaXdWyOoDM1GGLa?=
 =?us-ascii?Q?iaQPObnHn3f6cXvYxN15s8mnRjyySXBZC7+H2YnyzY4Y2NdhHBTqk6ENGeH2?=
 =?us-ascii?Q?8II9MVjjAPcCQj1ZhFA7bkfsEw80LDiMuDAhs2NKqfWwC7vCRT7NxxUgC4Ib?=
 =?us-ascii?Q?j93UihZoZQr96yhquz2hhYMZ+X0c7M9q3w52kQDWqHgPrIP4+X9T84+MzIZf?=
 =?us-ascii?Q?rNGv47GEqFFQeDkZzubUqPjD6REQ4/SKzdBUmUCdwmfmNFNK7H0S9I39uARQ?=
 =?us-ascii?Q?Q5y5hdcdZu08AQpefzyvmVRfhs7w1X2Nbe7LBk4GZs2JvXxLLawBoT/blYc9?=
 =?us-ascii?Q?+tuAPa5PIGPuNxEFPWp4k6ZSN/AcRSvZwzCEFaF4CWxUMWlXVq8K67XJI40l?=
 =?us-ascii?Q?0KrLOBY2PKLf8jgnzooD5T6AIzRjHQA+QeaiIxAK/KRRJYJZE39lufIudjY3?=
 =?us-ascii?Q?M1AXb7k57XfBr/gJymDthGvMeEbj4Np7mkpjbS1TtrCYaJAcaNGculj4Mnv2?=
 =?us-ascii?Q?2xcb2X2pasJdbX/uZ6rb5mRUQm8P7CqDALI3J7rflQ/cbo827+kNgoXCEoXa?=
 =?us-ascii?Q?5h6eWq5wWmCYppb/l7RCyfYGUQv2mH6bDk8/iy5rGSIVGnl+7cT/+UVFvZ9M?=
 =?us-ascii?Q?A4Nx4xJO6D41/N0oQJhDvMEywJVDpH0dFyYg+stQo6sg2JnO/CFLHFHWYGwO?=
 =?us-ascii?Q?8e5znQLf/mYyLUBlKZfnQVHkL/2YEImK2HOYkWSJZZuY7T/n7uHSorBcK9eU?=
 =?us-ascii?Q?4FDxtscgNjmIxajt/Zsx2KqDhyWrK2jg95H08rd3RFdOty0eeb4QvVNadUpd?=
 =?us-ascii?Q?or+2fqZ6UnM5+HI1kE+aYtoCJCq2Ap6a6QeEzGBRwYuvY+E1VTuAen7dQnpg?=
 =?us-ascii?Q?BaLXfMXdhmvj0CRt1KOkKLQESd/cDuAdPl5atpvtXEzB/vDBQOtrJueTDRXf?=
 =?us-ascii?Q?Vzl4bzHxcDWGYJYFtr+0ZleJd0pDtaRPt/YnS3vg6jNuDSHUXGVzCVQ92f0P?=
 =?us-ascii?Q?N42gQ68tTgvQ4WGdChUMkTLGIgrEmo5LLRVUcYkHJgD4MUYifAeUdYSzr1YR?=
 =?us-ascii?Q?7ueHPwtXTJUF64mXvNcjioXT+RE0lELasYrcl3/mOcgWxsEYFz6bINZX7a+f?=
 =?us-ascii?Q?zOIE6zUxNWNgnvAztbDWEGYuZsxPpZ1p0IUk7T4VyrcX8GtQwlrXiOeQ1/gT?=
 =?us-ascii?Q?ptpM3s9BPJX1D6FYdWl1MqrSL0mWOCeCn1j3ILodmOSrJlP11qfXOxmh1Y/F?=
 =?us-ascii?Q?vUIWoiZ5wLLnuMsElH0YORLiqgpKrBuA/At7GVRyGuQUbzDqcRf54KHw9jwD?=
 =?us-ascii?Q?Di63cFlCigjcsBxgTNsjmWDxmMRBIUuRjEpFmhQkOepLT4/Bp1fS?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2f6b3b-d437-46d1-dc09-08dee6f14693
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:27.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBKFzPEpNcu1MoBQxDe5LhFYd9JmORi052RDM9Dqhtc5LFD8XB+8l95NbmdaT/IZ4FsDWAS5A7o07+Vp9Qeb6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

Allow PCI ID match data to pass dw_edma_chip flags into dw_edma_probe().
This keeps per-device policy in the match data instead of open-coding it
in probe().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 37be455b7b6f..64f2a80072bc 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -88,6 +88,7 @@ struct dw_edma_pcie_match_data {
 	int (*parse_caps)(struct pci_dev *pdev,
 			  struct dw_edma_pcie_data *pdata);
 	unsigned long flags;
+	u32 chip_flags;
 };
 
 #define DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF	BIT(0)
@@ -471,6 +472,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	chip->dev = dev;
 
 	chip->mf = dma_data->mf;
+	chip->flags = match->chip_flags;
 	chip->nr_irqs = nr_irqs;
 	chip->ops = match->plat_ops;
 	chip->cfg_non_ll = dma_data->cfg_non_ll;
-- 
2.51.0

