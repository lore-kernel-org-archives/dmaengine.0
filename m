Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021073.outbound.protection.outlook.com [40.107.74.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0AA4963A6;
	Thu, 13 Aug 2026 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639172; cv=fail; b=Mgrfjm27khtXq0aaW1tKW1XF0F7TKYPWPvtREn+80BMcvbtmCXUvok5TCMhtYmv6YCgkNniGT82yTDxpLmteMZYpfJTfITAMXFDQOnR/14YXXmKgHORFjnpN66cU91g+jdV2/FvrGBUgn+ZL8eLhca3mKd8nRrREfBlcU7iQXmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639172; c=relaxed/simple;
	bh=1HQ8hKNRTtH77a8hE2t8+e7tamRaIU15LSMbpgUsTs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tEAEQWD5Qjbf3f+o+e6L4MDxhx9+XBo1mPiKsK/biWoGgaCM6Ajsa1iFbe1tVOdsqiEiStR70ekUKKxg3bMyGUkvWRR6tUqCbz+/mVB5WGg+6ErCRzoKh7gM8INiS+uxZ8QsDwREfwMfV08o6OYrPm92U+PQ4gBJP7fPxIDVu20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Z509oa4w; arc=fail smtp.client-ip=40.107.74.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Z509oa4w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CquBiVC3k7gL6rMcsnaruVW0mpwz6+oZylhzuBFYiTm6oE38X5hgP4Wh9G71II60q5kzTDolxV6XZD3whbea77pgTv2biDim9Br2CbO7Je2xtSfshOcO7hTXww2yf47u+QJfJOYKK6NE57PW9bK3GK7ODTCIvX3bTtKHokuPZSeEWtJVRe89jW7ZM0VCbfXf0cuPgL8EiJF1ANKd7aWlYkWYVuRd9oYU7YDUoKWC4dHL9cmLJRnjw+lDuNORJN6AmabCPkbc5fBwh8A4MjmLmlXD2guR3k0QCBkLv0ZM5QD/RKdgb4UDMkAtfAfMnunguhaKmEdN5Dm7sVO++Ur3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dEG/3l/+0/3kcxaZeBCnos/ASLyFDaW05Snhy5CxZc=;
 b=diYsa/IbNULjAHgdlXlFfOKSb/EkpFONIf8OPefWXCgo69A4pTxCxoaZKX4EeIO0vOYBFzf/eMMnppBWQmGSpVH/8V5MSRE6vCCdf1WS5h+gEP8LTt3OmGP7D5iMIhFwDhAWPN7NTIGUOolon/W2NLT8/ARD8tXZ7oQEFI1Fjg+ZI+g0XeiIzUu7KpllpL58+ydHj5aIU72GwplH4y1Qljw/xgdyzSNBwlEWeQ9Q7IzT/iYrsk3gWCQ6fTHaoRR3uegHbKAlafzZlOjWPvpR+pB7dqxUlLlsu5di0CLYUCgm+ZVCZGmMNYyVCAiaw8HoOQ32SKMdshiLy4KYyZdS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dEG/3l/+0/3kcxaZeBCnos/ASLyFDaW05Snhy5CxZc=;
 b=Z509oa4wafu3ueeIkdyOus1+KcCy1R+RSRnf4Mn+rrBga/oIkq6CQZxnjKW+E5MzRHQFiXdlYuJrGK+p35ubqLOdxFXy2JPAnpwOGTd+k0qVOpWqqTyaIdNE/eGfmXVXb4QDxQtYKWDr5GIbyP3wEQNH7Np1CkI5bAM8g8Xym0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6214.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:420::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 16:39:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 16:39:22 +0000
Date: Fri, 14 Aug 2026 01:39:21 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Frank Li <Frank.Li@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/24] dmaengine: dw-edma: Support dynamic LL appends
Message-ID: <tkyu5rsxfa7i6rxxw6qxmmwke5qnlxptwx4j2s24fhftsmmf26@gamef2ec4wwm>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc10979-62d8-4c00-fe04-08def9596db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	gril7o0uuJNTHkDcfnq9GwdFm8gQyANKmhgYnEtr0skKM3lMFF6L81cSArDg5YHVWi1ilNSe9FF67M2OG5ulBoK+lKdAc/+W/pDePFmHGrl8tOZmvP2XQh8lOCmSlqOVreo6TPIygUctKsdxmD1iJGf2XFnudFb0xe0+X3IP6Q4nsR0vat9V66y+6SBWgO51Slm4sAM06aFzP6xTOsGn9KGcjbWiOUDg83guwtvAInKz9d0npXv3sHUS7483Cidua1vYpBFhRiJMOqe+S+LQpqJOOMGVuVvIKkdV9idNxLu3L2ZUvu2PrwlbvlqT+Nw/hvQJOrh4bzmM6Ubn/WZK1cvi5bZL/hbvl74WVUkdEKMwi5wCvSEgmrPKVF/EPYWGACFLX6iSc7jpeVPg60V48UfihprMbyFPXyta1AlWBCkoPpfB6L4TR1Y7kpUfaB/ukc78Gf4aRieBAZdMebsrXrwKAg6FxBxeTjVI2QYtxvy/NA7WojZITYCqerFELOpMLb6cWrMow5y63mY3M/P2dMr56aTYFj/eGAwIedXLZmfSSwgRFOtxBOZWw/MeohhYOMiR9ZEgLdlUiKOziUQyG5LtbsWcIMo424LP5t+hsXmx9eEXdO8HcKxicUtR9wU1St+pA2w9WFoXIfUEXvs1xjqIvuJ5hDIT8ayK5WZAQnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ucrCJGOsk+Vilr61O70mWNHtyOTq0bsmDrLnvAXoA4eUKridoloRv51e4NAp?=
 =?us-ascii?Q?4PLKzmvkzEX9Lfo++s81TbcVQrOi6Ycu3Emy38Cd70DT/uRtO4hSZGC3T6Hk?=
 =?us-ascii?Q?hhq7a3lMh+u5hXPas7ABlKBxKB3aUYOj8wasPn6hm8d3cJmHRBvrjyPvFUoc?=
 =?us-ascii?Q?kYTVF/P5LLXVb1xhoBSm9ZuwggyrH/GNdzSXn6cEi7RT8J7wrkZ4qY6QQMfe?=
 =?us-ascii?Q?FMCEFveiBTR5lF0ajbNRaKg7wHQP1wXzyIgeiZKFPXkawC7Nmwdt7GLjPCk8?=
 =?us-ascii?Q?5GQGKdzkWGHQJVtzuj0emLCfxBimNc/Q9hurgiJ9OArl6zTJ+xqYNiNweNhi?=
 =?us-ascii?Q?KSZadfTzAkl94F4Y8ifLveL8mDoyR0ePqopA6Ydk9NmKY1BbY1Q2TcuciAGD?=
 =?us-ascii?Q?K7y7Ss2VI90KfDM7iVuFgv9nnHA/j2WIn2uzWkpAhoNxkNKOIRkX1vXStKa4?=
 =?us-ascii?Q?ZKI6t5PCdJx+jLHas+OlI58hIp7AmYMRn0smkrCI0xZo0CBD3EUmb2X1Zwo4?=
 =?us-ascii?Q?gK5g8QE0Uhn61ss06dFEfWBKex4cw53W3d/A8BPVPNwFg9turQd6MJUNPSzv?=
 =?us-ascii?Q?qa1nenx5VfqHUv2UKo2fzKCRgsnxA5ttFCXC2gQMxSFwWBCKWG6Tq+etxe78?=
 =?us-ascii?Q?xMYvn6KgpAD5qIMdu5dC+HZulfBPUubdkaU7XQMA5S/3QQxymjcNUmPH0EXr?=
 =?us-ascii?Q?t7Gc54LqgvDJ51pGoyWgNXobbvd38TSdKFf1gn9RgxB66uFHRPhkWBstvLaO?=
 =?us-ascii?Q?MJQBG2T8y4z0dQOYG9x2r2Z+lA18CIrSljQlzrZ+tL4zCdSeTJbKGIT+rp+1?=
 =?us-ascii?Q?d8G6vd7UcDV3mjZR3Mjv9A4cbTYh5dp10Gti8WwTO8jOGaCYKMs+Dt9L+77v?=
 =?us-ascii?Q?CjmfldjrIk8pY9G4XX0rCTlNEfuHeS1Rv2SyPfyMgXh29w3ZBAg6kulUeJS8?=
 =?us-ascii?Q?G1zqyt0E0oWovD/Dygvzl9CLWpOk5H9V6TwOw5ZE9D9jDPLO+el9xDg0Ys/u?=
 =?us-ascii?Q?CYM9UhHu/cRc8+P1X8t6kg0K2BVKbU4QjDEnpgXX8N8qLYnWb6WVG51f8q/u?=
 =?us-ascii?Q?gdTQ/RaBiEBlrGb+9iEGqRyNPp8rKqFWxYRi1ygEEqfB7XRSbK80GuB5zILV?=
 =?us-ascii?Q?87uSzgMpWBQwYwbH7+llot4iZ6rzq1ivARQtR2jd33BButr9LrlLV9ldMgye?=
 =?us-ascii?Q?/0D26aiTNI29zb8thbJ0PTxRopBkRz9zPTRe8nCG1sGbTjU5zDvkGO1WFbma?=
 =?us-ascii?Q?RDRnpd5S7ys/wgBJARSl/mB/jeGLsEJMB6rCWkNYFhUOcPakmrQWZckdY+x0?=
 =?us-ascii?Q?0w7vbQueZTPuv74KoHVc5elsY0ADnjzJpku7o3sUVTgI5H/ILq8oV2+dtyk+?=
 =?us-ascii?Q?O339dVjz5NJjaEfH9JnbdhOFvRBNl2MfNIdh/n7M3B7Kg+dfrEyDtQpWzKT7?=
 =?us-ascii?Q?xf/TCXaMGMESlWOIT5cTkcsXmfNe4uVbb9cIcelKw8qbkejZf4u1JV126UGJ?=
 =?us-ascii?Q?do79QZuUmtE4cYH0/fNXT5v5kMkfK2TihhexuBRPs0mw5GiYlV6lDQJpx+LM?=
 =?us-ascii?Q?aD3jmrH+HTtMU47BIbXXV7VcVoZvRhuxs+1aNVGT/p88ImgE2kynyI4XdrDQ?=
 =?us-ascii?Q?m4lfWLf0CAkI/kHtZAFh55fUYkEa0tSBk7KmE3HSGRhulEvZTx49LNfNE6ch?=
 =?us-ascii?Q?rZwGW69SKhwAK65btJ8nANTRtnkCc1rkjGBYnCL636/ZKu0MEJ1dvm33hZKQ?=
 =?us-ascii?Q?W4Bsy4yRAjMbd6ncpYG16BtQZEpWNOL01B5ZS8+n0iIT9yF1AyaW?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc10979-62d8-4c00-fe04-08def9596db2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:39:22.2281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qN29PVnnay5wPMbNTOxtYgz4ArvLNhY5UgkduNdKQCM/+C+bzmaxC6C/3d+NQgvkdwgbXe5tdN2+O2ydZ5XZqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6214

On Thu, Aug 13, 2026 at 12:56:57AM +0900, Koichiro Den wrote:
> Hi,
> 
> This is v5 of the dw-edma dynamic-append work originally proposed by
> Frank Li in his RFT:
> 
>   https://lore.kernel.org/r/20260109-edma_dymatic-v1-0-9a98c9c98536@nxp.com/
> 
> The driver currently treats each linked list as a finite transfer and
> waits for completion before publishing more work. This series turns the
> list into a circular producer/consumer ring and lets LL channels accept
> new requests while running.
> 
> The motivation and hardware observations are unchanged since v2, linked
> below. v5 mainly addresses feedback from Frank and Sashiko. It adds no
> new patches.
> 
> With multiple dmaengine descriptors in one ring, entry reclamation and
> descriptor completion need separate boundaries. The series records
> IRQ-paired LLP samples, uses a conservative running boundary for both
> eDMA and HDMA, and centralizes when a stopped channel needs another
> doorbell.
> 
> The recovery patches add an opt-in safeguard for eDMA with direction
> reset operations. On one integration, sustained multi-channel traffic
> [1] could leave a channel stopped with pending entries. Repeated
> doorbells did not restart it, while toggling ENGINE_EN did. Doorbell
> timing remains the leading suspect: under heavy multi-channel load,
> channel-status updates visible to software appear to lag internal
> start/stop transitions. That said, the exact trigger is still unknown.
> Any insight from Synopsys would be greatly appreciated.

Hi Gustavo, Frank,

Could I ask whether there are any known errata around the following?

1. Can issuing a doorbell before the hardware channel has fully stopped cause
   any harm?

2. Can the CS (Channel Status) value observed by software lag the internal
   channel state enough that software sees STOPPED while the channel is actually
   starting or running?

3. Once DONE, CS=STOPPED and XFER_SIZE=0 are visible, is there any other
   architected indication software should wait for before issuing another
   doorbell?

Frank mentioned in his RFT that a doorbell can be missed while the channel
is running. Frank, was your observation limited to the doorbell simply being
ignored while normal progress continued?

(Note: my testbed is R-Car S4 Spider board, which integrates DWC PCIe Controller
IP v5.20a with early element fetch enabled.)




... Sorry this got long. I just wanted to share what I observed and why this
series has gronw so much since v2.

TL;DR:

The original dynamic-append series was much smaller. I then started seeing rare
stalls under very heavy load, especially when exercising several hardware
channels concurrently. Register traces pointed to the start-side hazard [B] and
stop-side hazard [A] described below.

That is why the series has grown since v2. It now tries to avoid the start-side
hazard [B] and to recover automatically from the stop-side failure [A].

Details:

I drew the following rough picture while debugging this. It is only a working
model, not a specification. I inferred the phases from register traces and the
LL flow described by the databook. The phase boundaries themselves are not
directly observable.

    inferred HW state                    CS reads     XFER_SIZE reads
    =================                    ========     ===============

    (1) settled stop                     STOPPED      0
          :                              (true)
          :  <== doorbell write
          v
    (2) start pending                 ^  STOPPED      0
        (doorbell accepted, channel   |  (STALE)
         arbitrating, nothing         |
         fetched yet)                 |
          :                           |
          v                           |
    (3) element fetch                 |  STOPPED      0
        (descriptor read in flight)   |  (STALE)
          :                          [B]
          v                           |
    (4) context load                  |  STOPPED      0, then the
        (channel registers being      |  (STALE)      element size,
         written, size lands early)   |               written early in
          :                           |               the load
          v                           |
    (5) data transfer, element k      |  STOPPED      counting down,
          :                           |  (STALE)      nonzero
          v                           |
    (6) element boundary              |  STOPPED      0 for an instant
        (DONE fires, loops back       |  (STALE)
         to (3) for element k+1)      v
          :
          :   ..CS flips to RUNNING at an unpredictable internal
          :     point. In the longest case captured under heavy load,
          :     it was still stale about 100 us after the ring. No
          :     architectural bound is known to software.
          v
    (7) running steady state             RUNNING      live
        (the same (3)-(6) loop, but      (true)
         the readings now truthful)
          :
          v
    (8) last published element done,     STOPPED      0
        next fetch sees a CB             (true *)
        mismatch, channel stops,
        DONE fired
          :                           ^
          v                           |
    (9) internal stop retirement     [A] STOPPED      0
        (no documented bound and      |  (true)       both readings
         architecturally invisible)   v               IDENTICAL to (1)
          :
          v
    (1) settled stop                     STOPPED      0

  [B] marks the span where CS falsely reads STOPPED. A doorbell based on that
      reading can land while the previous start is still in flight, or while the
      channel is already running.

  [A] marks the suspected span where all software-visible state indicates a
      settled stop while the stop may still be completing internally. From
      software, this looks identical to (1).

  *)  If CS is late to reflect a stop, it still reads RUNNING, which only delays
      a new kick. The problematic case is after STOPPED has become visible but
      the channel may not yet be fully settled.

What the traces indicate about a doorbell issued in each range:

    range                  observed result
    =====                  ================================================

    (1) settled stop       The intended resume. Repeatedly observed to
                           work.

    (2) start pending      I could not determine from the traces what happens if
                           a doorbell lands here.

    (3)-(6), class (B)     CS can falsely read STOPPED here. A second
                           doorbell based on such a reading immediately
                           preceded a wedge. The exact internal landing,
                           and whether the doorbell alone caused it, could
                           not be determined.

    (7) running            The doorbell may be missed, as Frank's RFT
                           noted. It cannot be relied on to make the
                           channel consume newly published entries.

    (8)-(9), class (A)     A resume doorbell was swallowed with no error
                           or progress. Later doorbells were ignored.
                           Toggling ENGINE_EN recovered the direction.


For class (B), in the longest case captured under heavy multi-channel load, a
doorbell-time snapshot still showed CS as STOPPED roughly 100 us after the
previous doorbell, even though channel activity had already begun. Under light
load, the observed lag was normally around 1-2 us. CS alone does not reveal
where the hardware is within [B].

For class (A), we captured a case where every software-visible stop condition
had already been met. DONE had been recorded, DMA_LLP named the expected
boundary, CS read STOPPED, XFER_SIZE was zero, and the newly published entry had
matching CB/CCS. The resume doorbell was still swallowed, and later doorbells
produced no progress or error. Toggling ENGINE_EN recovered the direction. Under
the multi-channel heavy load described in [1], this failure was observed roughly
once per million stop/restart cycles.

I do not mean that the internal phase (9) itself was directly observed. It is
the model that best fits the fact that all software-visible stop conditions were
satisfied while the doorbell was nevertheless ignored. The exact internal
trigger remains unknown (at least to me).

The class (B) observation led to the following precautions:

  - record the observed LL event and DMA_LLP together in the same IRQ pass;
  - serialize LL event capture against channel kicks;
  - permit at most one kick after each software-confirmed STOP boundary;
  - keep a running channel consuming new entries without another
    doorbell; and
  - recheck a stopped tail when the individual DONE observation may
    have been missed.

The class (A)-like failure led to the recovery path:

  - detect pending LL work that makes no progress;
  - stop publication and kicks for the affected direction;
  - wait for all channels in the direction to stop;
  - reset the direction and rebuild every pending LL context; and
  - re-enable it only after the reset has completed.

This is why patches 8-19 establish the event and descriptor lifetime rules
before patch 20 enables dynamic submission, and why patches 21-23 add the reset
fallback.

The patches in that range are not all hardware workarounds. Dynamic append
separates LL-entry consumption from dmaengine descriptor completion. STOP,
PAUSE, ABORT and teardown must preserve that distinction and must not release a
descriptor while harware may still own one of its entries. That accounting is
why those paths are also changed before dynamic submission is enabled.

Any correction to this model would be very useful. In particular, if there is an
architectural **safe-to-ring** condition that I have missed, some of the
defensive logic may be simplified.

Best regards,
Koichiro

> entered in the fio/nvmet_pci_epf tests below.
> 
> 
> Base
> ====
> 
> This series is based on dmaengine/next:
> commit 0d995da5fb97 ("dmaengine: dw-edma: Mark emulated IRQ as level-triggered")
> 
> 
> Re-testing with v5
> ==================
> 
> I re-tested v5 on the following three testbeds:
> 
> - eDMA: RK3588 Rock 5B, DWC PCIe v5.60a
>         R-Car S4, DWC PCIe v5.20a
> - HDMA: SpacemiT K3, DWC PCIe v6.30a [2]
> 
> 1. fio
> 
>    The fio setup uses nvmet_pci_epf with a null_blk-backed namespace,
>    runtime=30s, ramp_time=5s. The "Before" values reuse the baseline
>    measurements reported with v2. The "After" values are three
>    consecutive v5 runs.
> 
>    NOTE: The fio tests use nvmet_pci_epf, which does not keep the DMA
>          engine continuously busy. A workload that rarely lets the
>          engine stop would show the benefit of dynamic appends more
>          directly.
> 
>    - eDMA (RK3588)
> 
>      NOTE: The eDMA Before results include the separate regression
>            described in [3].
> 
>      Summary by group (BW delta %)
>        all          n=26 mean=+1132.8 median=+114.1 min= +50.8 max=+5383.5
>        read         n=14 mean=+2001.7 median=+864.8 min= +56.7 max=+5383.5
>        write        n=11 mean=+103.2 median= +95.4 min= +50.8 max=+180.0
>        qd32         n=16 mean=+1783.5 median=+178.5 min= +82.4 max=+5383.5
>        q1           n= 9 mean= +69.3 median= +60.7 min= +50.8 max=+133.2
>        small 4K     n= 6 mean=+110.7 median= +91.7 min= +60.7 max=+180.0
>        large >=128K n=20 mean=+1439.4 median=+120.4 min= +50.8 max=+5383.5
> 
>      Before mean -> After mean (MiB/s)
>        Case                        Before             After              Delta
>        --------------------------  -----------------  -----------------  -------
>        Rnd read     4KB q1  1j         19.2 (sd 7.5)     30.9 (sd 14.0)   +60.7%
>        Rnd read     4KB q32 1j         88.7 (sd 2.1)    164.7 (sd 45.3)   +85.6%
>        Rnd read     4KB q32 4j         88.7 (sd 1.3)    175.3 (sd 65.5)   +97.7%
>        Rnd read   128KB q1  1j      420.0 (sd 134.6)   658.0 (sd 122.6)   +56.7%
>        Rnd read   128KB q32 1j       142.0 (sd 37.7)   2550.0 (sd 49.1) +1695.8%
>        Rnd read   128KB q32 4j        63.7 (sd 10.6)   3028.3 (sd 28.5) +4656.5%
>        Rnd read   512KB q1  1j       572.0 (sd 35.8)    933.0 (sd 23.6)   +63.1%
>        Rnd read   512KB q32 1j        66.8 (sd 10.8)   3011.0 (sd 28.0) +4407.5%
>        Rnd read   512KB q32 4j        55.4 (sd 12.0)   3039.7 (sd 42.3) +5383.5%
>        Rnd write    4KB q1  1j         20.7 (sd 7.0)     33.8 (sd 11.6)   +62.9%
>        Rnd write    4KB q32 1j         42.5 (sd 0.9)    117.7 (sd 11.0)  +177.1%
>        Rnd write    4KB q32 4j         41.7 (sd 1.6)    116.7 (sd 12.4)  +180.0%
>        Rnd write  128KB q1  1j       330.0 (sd 90.1)    512.7 (sd 79.5)   +55.4%
>        Rnd write  128KB q32 1j      624.0 (sd 111.5)   1306.0 (sd 58.9)  +109.3%
>        Rnd write  128KB q32 4j       659.3 (sd 61.8)   1288.3 (sd 67.4)   +95.4%
>        Seq read   128KB q1  1j       260.7 (sd 25.8)    608.0 (sd 48.0)  +133.2%
>        Seq read   128KB q32 1j       149.7 (sd 30.9)   2539.0 (sd 62.2) +1596.4%
>        Seq read   512KB q1  1j       578.0 (sd 32.2)    923.7 (sd 21.0)   +59.8%
>        Seq read   512KB q32 1j        65.0 (sd 10.6)   3012.7 (sd 32.6) +4534.9%
>        Seq read     1MB q32 1j        57.3 (sd 18.8)   3032.7 (sd 44.3) +5192.6%
>        Seq write  128KB q1  1j       272.3 (sd 62.0)    493.7 (sd 95.6)   +81.3%
>        Seq write  128KB q32 1j      597.0 (sd 105.7)   1306.3 (sd 57.7)  +118.8%
>        Seq write  512KB q1  1j       476.7 (sd 26.7)    719.0 (sd 40.1)   +50.8%
>        Seq write  512KB q32 1j       710.7 (sd 44.0)   1296.3 (sd 60.6)   +82.4%
>        Seq write    1MB q32 1j      546.0 (sd 100.4)   1212.3 (sd 53.4)  +122.0%
>        Rnd rdwr  4K..1MB q8  4j      247.3 (sd 16.3)    971.7 (sd 50.5)  +292.9%
> 
>    - HDMA (SpacemiT K3)
> 
>      Summary by group (BW delta %)
>        all          n=26 mean= +90.2 median=+104.2 min= -23.5 max=+177.6
>        read         n=14 mean= +80.8 median= +79.3 min= -23.5 max=+177.6
>        write        n=11 mean= +97.7 median=+137.0 min= -21.0 max=+152.1
>        qd32         n=16 mean=+115.9 median=+113.7 min= +68.0 max=+177.6
>        q1           n= 9 mean= +39.1 median= +10.0 min= -23.5 max=+152.1
>        small 4K     n= 6 mean= +99.2 median=+113.7 min= +10.0 max=+177.6
>        large >=128K n=20 mean= +87.5 median=+102.6 min= -23.5 max=+152.1
> 
>      Before mean -> After mean (MiB/s)
>        Case                        Before             After              Delta
>        --------------------------  -----------------  -----------------  -------
>        Rnd read     4KB q1  1j         52.5 (sd 3.5)      64.0 (sd 9.3)   +21.9%
>        Rnd read     4KB q32 1j       108.1 (sd 90.9)    300.0 (sd 30.3)  +177.6%
>        Rnd read     4KB q32 4j       117.0 (sd 84.9)    302.7 (sd 30.0)  +158.6%
>        Rnd read   128KB q1  1j      835.7 (sd 139.6)   639.0 (sd 122.0)   -23.5%
>        Rnd read   128KB q32 1j       802.7 (sd 67.7)   1620.7 (sd 28.0)  +101.9%
>        Rnd read   128KB q32 4j      931.3 (sd 262.1)   1630.3 (sd 43.9)   +75.1%
>        Rnd read   512KB q1  1j      411.0 (sd 144.0)   867.0 (sd 132.9)  +110.9%
>        Rnd read   512KB q32 1j      969.0 (sd 210.7)   1628.3 (sd 42.2)   +68.0%
>        Rnd read   512KB q32 4j      889.7 (sd 298.0)   1633.7 (sd 51.4)   +83.6%
>        Rnd write    4KB q1  1j        46.0 (sd 15.5)      50.6 (sd 7.3)   +10.0%
>        Rnd write    4KB q32 1j        117.7 (sd 4.0)     246.3 (sd 0.6)  +109.3%
>        Rnd write    4KB q32 4j        113.0 (sd 5.3)     246.3 (sd 0.6)  +118.0%
>        Rnd write  128KB q1  1j      606.7 (sd 149.0)    479.3 (sd 38.8)   -21.0%
>        Rnd write  128KB q32 1j      533.6 (sd 512.3)    1264.3 (sd 0.6)  +137.0%
>        Rnd write  128KB q32 4j      526.0 (sd 514.9)    1265.3 (sd 0.6)  +140.6%
>        Seq read   128KB q1  1j      626.3 (sd 247.5)   624.7 (sd 118.7)    -0.3%
>        Seq read   128KB q32 1j       783.3 (sd 51.1)    1605.7 (sd 6.0)  +105.0%
>        Seq read   512KB q1  1j      464.0 (sd 191.5)    943.7 (sd 47.5)  +103.4%
>        Seq read   512KB q32 1j      918.3 (sd 241.8)    1602.7 (sd 2.5)   +74.5%
>        Seq read     1MB q32 1j      918.7 (sd 290.5)    1604.7 (sd 0.6)   +74.7%
>        Seq write  128KB q1  1j       611.0 (sd 79.8)   600.7 (sd 125.5)    -1.7%
>        Seq write  128KB q32 1j      521.8 (sd 515.3)    1264.0 (sd 1.0)  +142.2%
>        Seq write  512KB q1  1j      328.3 (sd 268.7)     827.7 (sd 7.4)  +152.1%
>        Seq write  512KB q32 1j      519.6 (sd 516.6)    1263.3 (sd 2.9)  +143.1%
>        Seq write    1MB q32 1j      515.1 (sd 517.8)    1264.7 (sd 0.6)  +145.5%
>        Rnd rdwr  4K..1MB q8  4j      355.3 (sd 64.7)     851.3 (sd 9.2)  +139.6%
> 
> 2. pci_endpoint_test
> 
>    READ_TEST and WRITE_TEST passed with v5 on all three testbeds.
> 
> 3. R-Car S4 (PCIe Gen4 x2, DWC PCIe controller v5.20a, eDMA) stress
> 
>    The non-upstream NTB transport/netdev saturated four HW channels in
>    each direction concurrently from multiple QPs. With v5, it still
>    reached EP->RC 19.5 Gbit/s and RC->EP 17.3 Gbit/s with iperf3 -ub0,
>    while keeping the DMA controller almost continuously busy.
> 
> 
> [1] The patch set posted at:
>     https://lore.kernel.org/r/20260810165136.2292436-1-den@valinux.co.jp/
>     makes it possible to impose such a heavy load on multiple hardware
>     channels, keeping one or more channels busy almost continuously.
>     Under this load, the odd stall can be observed roughly once every
>     ten to several tens of seconds. The recovery mechanism in this
>     series detects and resolves the situation automatically. The upper
>     layer sees only a brief but unavoidable performance hiccup.
> 
> [2] K3 was tested on an Ubuntu kernel with the prerequisite patches
>     backported (+ some tweaks on top), not directly on the upstream
>     base. The "Before" and "After" kernels differ only by this series.
> 
> [3] The current base includes commit 35de39e4511f ("dmaengine: dw-edma:
>     Defer channel IRQ handling to workqueue"), which defers channel IRQ
>     handling to an unbound workqueue. Under CPU pressure, some workloads
>     can see delayed completion processing and idle gaps between
>     descriptors. Dynamic appends largely hide those gaps by keeping the
>     engine fed.
> 
>     A BH workqueue would improve the nvmet_pci_epf workload, but it is
>     not a complete replacement because BH workqueues are per-CPU.
>     Retaining cross-channel CPU distribution would require the driver to
>     choose target CPUs and account for housekeeping masks and CPU
>     hotplug. That is too much complexity for a quick fix, so I have not
>     posted a separate change.
> 
>     This partly explains the unusually large eDMA gain in these tests.
> 
> 
> Best regards,
> Koichiro
> ---
> Changes in v5:
>   - Drop the unused event_scope, which should've been dropped in v4.
>     (Frank)
>   - Permit one eDMA restart after each software-confirmed STOP boundary,
>     avoiding a race between a STOP transition and software clearing its
>     interrupt status. (Sashiko)
>   - Keep direction recovery active after a reset timeout until the
>     engine is rebuilt and re-enabled. (Sashiko)
>   - Fix the delayed-recheck deadline calculation, reject an all-1's
>     DMA_LLP value, and export LL event enum values to the trace format.
>     (Sashiko)
> 
> Changes in v4:
>   - Use spinlock_t for LL event serialization, select the event lock
>     through a per-channel pointer, and use the common accessor in both
>     interrupt providers. (Frank)
>   - Put the remote LL publication read-back back in the high-level
>     doorbell helper, while keeping the provider callback as a raw
>     doorbell write. (Frank)
>   - Arm the stopped-tail recheck after a stopped channel is kicked,
>     reserve its zero sentinel across jiffies wrap, and keep the recheck
>     available without optional direction recovery. (Sashiko)
>   - Keep retrying failed direction resets with cancelable delayed work
>     instead of giving up after a fixed number of attempts. (Sashiko)
>   - Other smaller fixes, patch-ordering changes, and wording updates are
>     listed in the per-patch changelogs. (Frank, Sashiko)
> 
> Changes in v3:
>   - Main changes:
>     * Serialize IRQ event capture and ABORT handling with channel restart,
>       so deferred events cannot cross into a later hardware run. (Sashiko)
>     * Record each descriptor's physical LL range and validate it before
>       consuming IRQ-paired progress. Keep ring accounting valid across
>       termination, abort, and full resynchronization. (Frank, Sashiko)
>     * Rework stopped-tail and STOP/PAUSE handling: re-sample LLP before
>       restart, add one bounded eDMA recheck, and drain published entries
>       before completing a request. (Frank, Sashiko)
>     * Move LL interrupt placement into the common core and use the same
>       four-entry interval for eDMA and HDMA. (Frank)
>     * Restrict recovery to providers with usable direction-reset
>       operations and serialize it with IRQ/ABORT handling and teardown.
>       Rebuild all exposed LL contexts and flush remote LL writes before
>       re-enabling the engine. (Sashiko)
>   - Many other smaller fixes, refinements, and patch reorganizations
>     came from the v2 review, especially Sashiko's feedback. Each patch
>     has its own changelog below the --- separator, so the details are
>     not repeated here.
> 
> Changes in v2:
>   - v2 is a substantial rework; per-patch changelogs contain the details:
>     * Rebased onto dmaengine/next.
>     * Moved the remaining v1 fixes and state serialization changes into
>       the independent groundwork series, now merged in the base.
>     * Reworked ring progress around IRQ-paired LLP samples, conservative
>       running boundaries, and stopped-tail reconciliation.
>     * Reworked STOP/PAUSE handling and added full ring resynchronization
>       plus optional direction recovery before enabling dynamic
>       submission.
>     * Updated trace support for the reworked paths and added engine
>       recovery tracing.
> 
> v4: https://lore.kernel.org/r/20260729143036.3087722-1-den@valinux.co.jp/
> v3: https://lore.kernel.org/r/20260727170323.2321369-1-den@valinux.co.jp/
> v2: https://lore.kernel.org/r/20260723084150.521366-1-den@valinux.co.jp/
> v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/
> 
> 
> Frank Li (5):
>   dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL
>     entry index
>   dmaengine: dw-edma: Make DMA link list work as a circular buffer
>   dmaengine: dw-edma: Move callback result helper before LL helpers
>   dmaengine: dw-edma: Dynamically append requests while running
>   dmaengine: dw-edma: Add trace support
> 
> Koichiro Den (19):
>   dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL
>     control-word
>   dmaengine: dw-edma: Factor out linked-list transfer start
>   dmaengine: dw-edma: Dispatch DONE interrupts by channel request
>   dmaengine: dw-edma: Centralize LL doorbell decisions
>   dmaengine: dw-edma: Prepare LL progress event handling
>   dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
>   dmaengine: dw-edma: Prepare LL kicks for event serialization
>   dmaengine: dw-edma: Serialize LL event capture with channel kicks
>   dmaengine: dw-edma: Keep channels stopped while ABORT is pending
>   dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL
>     progress
>   dmaengine: dw-edma: Add LL interrupt placement policy
>   dmaengine: dw-edma: Recheck stopped LL channels before restart
>   dmaengine: dw-edma: Use HDMA watermarks as progress events
>   dmaengine: dw-edma: Recover stopped channels from tx_status()
>   dmaengine: dw-edma: Make the LL ring reset a full channel resync
>   dmaengine: dw-edma: Drain LL entries for STOP and PAUSE
>   dmaengine: dw-edma: Add engine reset and enable operations
>   dmaengine: dw-edma: Add engine recovery infrastructure
>   dmaengine: dw-edma: Detect and recover a stalled eDMA engine
> 
>  drivers/dma/dw-edma/Makefile          |    2 +
>  drivers/dma/dw-edma/dw-edma-core.c    | 1610 ++++++++++++++++++++++---
>  drivers/dma/dw-edma/dw-edma-core.h    |  161 ++-
>  drivers/dma/dw-edma/dw-edma-trace.c   |    4 +
>  drivers/dma/dw-edma/dw-edma-trace.h   |  176 +++
>  drivers/dma/dw-edma/dw-edma-v0-core.c |  202 +++-
>  drivers/dma/dw-edma/dw-hdma-v0-core.c |  164 ++-
>  drivers/dma/dw-edma/dw-hdma-v0-regs.h |    1 +
>  include/linux/dma/edma.h              |    2 +-
>  9 files changed, 2050 insertions(+), 272 deletions(-)
>  create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
>  create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h
> 
> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
> -- 
> 2.51.0
> 
> 
