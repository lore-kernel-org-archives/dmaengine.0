Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A53905F5;
	Sun,  2 Aug 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660883; cv=none; b=IsBNQfepQvhikhYYjJi43MSwVojpvVAru4zbC0QlV4kI7VOWunWlFuptIJ+CHg/7xpuxvZEfa1cFX4RSabp/jlZTVnoMcXfl2ackHMHvOo7DODhm067/u5qZypd8X4RwEv8rEzbzdn7Dt2B/waci3U5k/86m+ySEiJrZFtBHqOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660883; c=relaxed/simple;
	bh=KuuUMks3MetwrBhyUeDogIW/1crxv4+RDoXEC5CyUHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHb93mujwjQC5ies2KwkfalluD6jTNWK4O6LuJnATi0/kmIiq+tW+wBTT6ZTwmOc9B7OYJjrWkZAqocCPlRIS/4FnaSishanfV20qEVV3n0Gi2IhoGfnIjF7p/8MXh1umCKDIQyfgOFOtlW/tUqGSGBZqkPbF5G4jk1t8bAnsRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Fw1gnuka; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P/GIfVBp; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Fw1gnuka";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P/GIfVBp"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 6BFD2EC0179;
	Sun,  2 Aug 2026 04:54:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 04:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785660880; x=1785747280; bh=gKnaB2dgGb
	J5jB9Xzqclr9jITWfqjGY6bJtLu77qqnc=; b=Fw1gnukaBRsrcTW3cxsRi2amJD
	d3GFcnfZ7Nvsb+22c2QSRdV8Z24aZB1RENV5xCAiJbmmIr86rM23ndfQnoL4GTu+
	v1G3YDjRJ8fMN+LCQXl5Hd3s0ngOOjEs27ocWWGmLAKWn3w80cqSazX+5f+5aPYw
	IIEqFr7oqVze0pWDVoKxsSKoaWG8fh17lJ7nuQR/eKqj8VKR+dvskrZXZJQDtiQN
	K6HLHtVCZTETb+1NtqTD+fQNGRGfON+UaILntg+EBf8hs9nAWFGR1qRoDr1UjC/b
	WTOjmYG6eVZxaVLurzqqbxAe/nbc3Xvr3Y3MisanFBN6bge0hkW+2w4aLUPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785660880; x=1785747280; bh=gKnaB2dgGbJ5jB9Xzqclr9jITWfqjGY6bJt
	Lu77qqnc=; b=P/GIfVBpg20l/U0WCJx9Bxxd2EgVIYPdHxxP/qqf8fRJ4JeqboQ
	2zkMBgFkZWqhwqaY7W5gws94zPdyFpDS8skKKLIaRIfmO7yuLrMAa6cIk4No261q
	izWwcqghLE4hBFkh9mrXQfVkPKNUt91oZ2e75z94gi0DshnUx5LzNuHwcoLX+3Qd
	KIRVddRQ8BMS8mNQ0Yy8lfJioGD0chMG5eELPne8oDKflg2VAq4P7VOt+B+eCPiC
	qweE+Hqg3WFvRqjcPnRB9toYwGvb5gXf4b7LkTSe0t5gz467AKKGPHNJX+1qAMwh
	cDRrCnzZRCLch4ktFFBDRkMZMHSQXUTR49A==
X-ME-Sender: <xms:zwVvapF1AnkQpn43vRVWKZMJJM07o5oMtQCs8EpYNU9L871B_u8iVg>
    <xme:zwVvajic2AvG2rqELf6UO6qEcqG78nI69Qc7QRGFTgM2umKSRLPrwKeSa4ZG46NEc
    Whah2r5FoCebZPyZgccGy76HRa4pyrhFrv5HGpjxgZjP4dl37-VYw>
X-ME-Received: <xmr:zwVvauhbn1pEHyRxGnGjrfgR0Y2FydPrLOC_OP19Z-ciEihpYV0KsGFgBVzUaZFtcuQiTgQpvK5nf1WLxMSoCMs-t9LX2zdzhNQ>
X-ME-Proxy-Cause: dmFkZTG1UE0N2DlUNxsWY7EVfblw8xV1Uq53IGZDVc5JfJgYvhuiA4K+Wbd9VzYSvAY4H2
    ZdlRzurNW+y/PNikHFY+9wr9wz95bHx/8tG0mlHcYx9HhDhB0h0OEMF2NWcKgE+63h932Z
    g+FwQvLym/t/+tZaThPh0W/+vydnAL15XYn3Xoj7KugiCjjw822xnY2dr8pLuU8GzIc0N1
    YA9AQ/SUUDMes4tmHsDJzp/3+DKKO6017of3tv9XnPRqmaVw4tbwSbh3txUvzVID3LCin5
    hDXyqDoDo+F5qtLhYWjNSc+QFqwBvA+j1E8UC1ulSvHSa9SqhmFTiU7VGYUTpVdVZiwgFa
    dpmM6bZbotYpMaRO8FLKeXAuxe3f4034tOA+lbqBLKVpL3EINQbrDA6zzkcbdsMUs5XeBw
    rlrD/RUTTCFhRpiCf2Q3UC8bwhjMQEL0jRFYeafYzTENDec4jWP+tKSq4KJXNcDhj+s0ps
    dgfsCuFwEKhiiT2zRsLnwIVtJhVijDHWC9mpBHc0Zw4mHm/2yxNmb3ZlzZCraVnuDl7jX9
    jZAnQ+uL8kFph6+EYJLFoWMPVaE657uHERvA4ddjhIa6GLN+ZAcksSfsQglGJvQiFLUbhr
    yxVMBEdarPT2s5tdYvpL5IauJemfnyqe9IN13nmi3oC9FjP8v/YRGtp0znCQ
X-ME-Proxy: <xmx:zwVvaunQakql0sbJwooUmiUbF6KHfsaYOnVmfxX88lYoqQO5pYm49A>
    <xmx:zwVvaqbccy7LKxUq3IrOKJC35xpWwvGgh0vBuON7fcU-H2Dolj51vg>
    <xmx:zwVvapyWen3RLprAYXYAjgu1IxYiRTZshBQ_MYq0s_hFjHceDxwsJA>
    <xmx:zwVvapbZDfNtiICrSXo2b7ISE555IhY-J4Oof357S8xnBwtqju_-LQ>
    <xmx:0AVvai6DjE2d69OFh2Z0nXIiNf82eh9zV5qiuWwoSh5bHYCqao-OmQ9W>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 04:54:39 -0400 (EDT)
Date: Sun, 2 Aug 2026 10:54:37 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Message-ID: <20260802085437.GA806854@robin.jannau.net>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
 <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>

On Wed, Jul 29, 2026 at 01:46:35PM +0200, Sasha Finkelstein wrote:
> The admacs present on t8122 and t603x SoCs need additional writes in
> order to operate correctly. The exact purpose of this register
> is unknown
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/dma/apple-admac.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a481..72ff677c8ce5 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -39,10 +39,14 @@
>  
>  #define FLAG_DESC_NOTIFY	BIT(16)
>  
> +#define T8122_UNK_28_VAL	0x200000

maybe BIT(21)

>  #define REG_TX_START		0x0000
>  #define REG_TX_STOP		0x0004
>  #define REG_RX_START		0x0008
>  #define REG_RX_STOP		0x000c
> +#define REG_UNK_28		0x0028
> +#define REG_UNK_2C		0x002c
>  #define REG_IMPRINT		0x0090
>  #define REG_TX_SRAM_SIZE	0x0094
>  #define REG_RX_SRAM_SIZE	0x0098
> @@ -127,6 +131,7 @@ struct admac_data {
>  	struct mutex cache_alloc_lock;
>  	struct admac_sram txcache, rxcache;
>  
> +	bool set_unk28;
>  	int irq;
>  	int irq_index;
>  	int nchannels;
> @@ -147,6 +152,10 @@ struct admac_tx {
>  	struct list_head node;
>  };
>  
> +struct admac_hw {
> +	bool set_unk28;
> +};
> +
>  static int admac_alloc_sram_carveout(struct admac_data *ad,
>  				     enum dma_transfer_direction dir,
>  				     u32 *out)
> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
>  
> +	if (ad->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}

can this be done in probe? This writes the same value for every channel
without obvious way how the bit in those two registers can reset? If it
needs to be done here a comment explaining why would be useful.

If it can be done in probe we could avoid putting set_unk28 into struct
admac_data.

Janne
