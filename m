Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97639446B;
	Sun,  2 Aug 2026 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661417; cv=none; b=mRhyvP/cSBMJGjwLmgjkwfVmaAmfsuWLUO+mXIHSmJEnudYo2NiiLyrTG4VisEDr+Las92K5VSFUkkbvGxQTc9Hn54hQwhbsBhfjJ8EVhPL2sBGVGSgvxx4UAIgG/vqv3VwrakC8tcRc3yfG6TqnXa1tG4vDH39xul8jxeGEw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661417; c=relaxed/simple;
	bh=tVFVxLd/XVzU836PdWgXeU6KVTWz9bou5XC4X2akdq8=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gl+tsQkfcOq9nUMSmzwxsvKYd4DiYeyOarxvqqWpKJd+pCZMql2wGlihKqZEldqjPbKDM22DMFaeRJ0rn+6Rj0oeMgVKYBknBQ8jvgjGhpU0LovKNTGDVDTnU0o2Qm/KjIbYqlkWXspEeZ+AuL5ZESu9zFTvEQedgLAk3gyoEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=BXWbBUiE; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="BXWbBUiE"
Received: by chaosmail.tech (Postfix) id EDFEB1C878A;
	Sun, 02 Aug 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785661409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85mK8UDi7QBt5jRlKz/7QZeVLFWA6U447/S6wVm/foA=;
	b=BXWbBUiEb3uVA/1XQUswnLyz+0300SrCRvxedsG2jqHRPfNKGH3RtC3U4RrlCRfdgtDObe
	HxLo2fxifS0FpMNW51EhEHAkR0LHcXJFkL22Fw4/CBDkC50tGjGtObdLC9sNxtywpEUW/w
	vskDobfKQ370LfOaAEcM89eOmhYnXuY=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260802085437.GA806854@robin.jannau.net>
Date: Sun, 2 Aug 2026 11:03:18 +0200
Cc: Sven Peter <sven@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6AC365D2-475C-4DE4-BDFC-C31923A121B6@chaosmail.tech>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
 <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
 <20260802085437.GA806854@robin.jannau.net>
To: Janne Grunau <j@jannau.net>

On Aug 2, 2026, at 10:54, Janne Grunau <j@jannau.net> wrote:
> 
> On Wed, Jul 29, 2026 at 01:46:35PM +0200, Sasha Finkelstein wrote:
>> The admacs present on t8122 and t603x SoCs need additional writes in
>> order to operate correctly. The exact purpose of this register
>> is unknown
>> 
>> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
>> ---
>> drivers/dma/apple-admac.c | 32 ++++++++++++++++++++++++++++++--
>> 1 file changed, 30 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
>> index 14a5ee14a481..72ff677c8ce5 100644
>> --- a/drivers/dma/apple-admac.c
>> +++ b/drivers/dma/apple-admac.c
>> @@ -39,10 +39,14 @@
>> 
>> #define FLAG_DESC_NOTIFY BIT(16)
>> 
>> +#define T8122_UNK_28_VAL 0x200000
> 
> maybe BIT(21)

Probably not, this is not in any way related to channel 21. I suspect
but can't confirm that this is rather an address.

> 
>> #define REG_TX_START 0x0000
>> #define REG_TX_STOP 0x0004
>> #define REG_RX_START 0x0008
>> #define REG_RX_STOP 0x000c
>> +#define REG_UNK_28 0x0028
>> +#define REG_UNK_2C 0x002c
>> #define REG_IMPRINT 0x0090
>> #define REG_TX_SRAM_SIZE 0x0094
>> #define REG_RX_SRAM_SIZE 0x0098
>> @@ -127,6 +131,7 @@ struct admac_data {
>> struct mutex cache_alloc_lock;
>> struct admac_sram txcache, rxcache;
>> 
>> + bool set_unk28;
>> int irq;
>> int irq_index;
>> int nchannels;
>> @@ -147,6 +152,10 @@ struct admac_tx {
>> struct list_head node;
>> };
>> 
>> +struct admac_hw {
>> + bool set_unk28;
>> +};
>> +
>> static int admac_alloc_sram_carveout(struct admac_data *ad,
>>      enum dma_transfer_direction dir,
>>      u32 *out)
>> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>> u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>> ~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
>> 
>> + if (ad->set_unk28) {
>> + writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
>> + writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
>> + }
> 
> can this be done in probe? This writes the same value for every channel
> without obvious way how the bit in those two registers can reset? If it
> needs to be done here a comment explaining why would be useful.

Those are getting reset. The AOP-attached ADMAC has it's power
controlled by the AOP firmware, so I can't even touch any registers
in probe, as the hw is off at that point and will SError at us.
device_config is the earliest point when the ADMAC is powered on. There
is an explanation of this setup in the commit history for this file.
(8d55e8a16f019211163f1180fd9f9fbe05901900)


