Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5522BD587;
	Sun,  2 Aug 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660960; cv=none; b=dKavhWr2G6YCeLmw9RF/olc4MisLTMxYQzk5NfFJfPxsbfvFWaDWMZTiFc46IvQTH7ZhldLyprXdqacy+sS7eZyHPfpfNlqBmVOaCA3B2SSfb542U3RMe0AL51vd6YOA9oZKtnigRgWrxDpmUEPRh7gvsmuN1OSGWErAdAng6f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660960; c=relaxed/simple;
	bh=9dHhpjjcsAjgUsmJSz1RZEy7xhFr7YN9m8sDKyrd4jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T78+Yh0tOR4HOu0R9eCVy9/JQ7OyBFFw9gzSK36RMawtg/a14Og/eCmGVBgLtQVu7mNbZjBbzzTGZmiTe7uxxDirbVP+Kt+ZujFw5Znp7jdUh7AtEyHJgYSfmVB77NpI5cq60qeOdTPRgRRVAncmfUwFlXKSSoNkmK0M8SxXYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=eStjXL4P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZFHg4QFO; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="eStjXL4P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZFHg4QFO"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 46C58EC0179;
	Sun,  2 Aug 2026 04:55:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 02 Aug 2026 04:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785660958; x=1785747358; bh=oTSgntEhSg
	WsAAYTp6KD100cEZiwqoxJhz3o992eaLA=; b=eStjXL4Ps9CwOfzPE0Cg4cAm+k
	ZL4oucqFhr4yHuu+bJn9QCjCByLL3F67HAHcsNnCPsLFhY1GhaV5MhRvBSInF7KQ
	M4G/wlwsKQKgVjUNjgkXHFElbm2Y1g6Ev/ROZopQ7G4SSloun7Uu/cl86H4Q+3rf
	dnRcHO0eGX+RQfUXQ91L+y8SZCkLWEP4RSaLGe/suxLniANPl+0CLzaOiksnPY0o
	2OLto02BaiXeIgKREqgoUlAERk+X+l7mROdLHHXV9JE0F1jhV40Zyj/PqBNo+95P
	BWsauUF0H41Kr/RZCZfD9a+M9oM3D5Keje7gNCnxHvckcFHVqDBKZhdPpxnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785660958; x=1785747358; bh=oTSgntEhSgWsAAYTp6KD100cEZiwqoxJhz3
	o992eaLA=; b=ZFHg4QFO9YMdD0bMP9A4rC2hyuY9O9GSeSJJinWzKVEhcGeFDWO
	CqCvx2Tpy6ueH1fwKzePO2ZzF8mOcQJzx32vAKIeYRSeRblnf8dQqlHMSuCH19nV
	Dn/068PkE2xaKhtEalaRCE8UDDI39/tLeJWJ7FS2B9dsSusuNyacFZxeqz/+ldi8
	7SVDaK61d3JP2ys0142740zzgxIApdZeV4bY5B5NfKqrhtTLdqNiJ6dGz/XJYSHs
	D2jmD8tDG5IZDJ9W1P/xY84vBNYTUihCfuCxbjmgTG8vjVcU1B5ZDPmBp9LASljF
	IRoFIYGzYi7J0v88NVY/sMx50K1u7RnWimg==
X-ME-Sender: <xms:HQZvarfGsZikdqHgFwp3sXKknf82en-LXoQro9Qoi6aAt27Y2CqsQA>
    <xme:HQZvatCltEvSHQGqqLtzcJTCnhp7jv__cV7JBGRbrKS0XOb8rAwuKXkinvDoqH0UK
    G5O5Loc93UGWgo1CecUlvH_nCUMCC3PwkpaVS8sZg0zPJ6XVW5aVA>
X-ME-Received: <xmr:HQZvaq-dCuDmV1uw6rAdy3qM0E94sdZMMgtG4CRbM6plxVHuNbHQ0q0NUelTfBCjrelr3q0MyIjOwsjNEQX5O9pQl4dXAHPqR50>
X-ME-Proxy-Cause: dmFkZTG1UE0N2DlUNxsWY7EVfblw8xV1Uq53IGZDVc5JfJgYvhuiA4K+Wbd9VzYSvAY4H2
    ZdlRzurNW+y/PNikHFY+9wr9wz95bHx/8tG0mlHcYx9HhDhB0h0OEMF2NWcKgE+63h932Z
    g+FwQvLym/t/+tZaThPh0W/+vydnAL15XYn3Xoj7KugiCjjw822xnY2dr8pLuU8GzIc0N1
    YA9AQ/SUUDMes4tmHsDJzp/3+DKKO6017of3tv9XnPRqmaVw4tbwSbh3txUvzVID3LCin5
    hDXyqDoDo+F5qtLhYWjNSc+QFqwBvA+j1E8UC1ulSvHSa9SqhmFTiU7VGYUTpVdVZiwgEn
    IizRTIED8XjJvWFRzJ3ejmiXtgo80umPfmgqyA6vNWC8YXOqoece4mLSdGrjxzkKEMDCH6
    W0nGCoy0sWaOe4A4lbf9K1TFlZtT/6RAFnwNgnERErKgB+KBe4x1FQNLm4bZqZMCVOCOpn
    S8hzoz1f/bRjsfdK2HsPF38lWrbIFFjpzT58DbVFcMFYL//2z+pGG4Aqb6HVbP69fXKugU
    BnboKr/MNmHzO4yJTHLy0pdBUevcBcrJI70+Y+e19QWPWu3VLvLUMV0QI0tvNVnZNJ+yR1
    A1KmT7E+zvSZ96HNT6TvQMGznzpvHzZpQLrssrkUF+d/DXMBQEG8VGEre3fA
X-ME-Proxy: <xmx:HQZvappir6G_xhskWkkT1ntOVvLWsCwnipsPZe7ffIe2YGVFuQbtww>
    <xmx:HQZvasHK5Q_KTC1tb89MuQrjetE_nbjk0F5utGjWfpOodMA49Xc8HA>
    <xmx:HQZval8q0OF52NRhlAhoSDb2i-mr2NIINih_Y-EnV4dLnH_AVltduA>
    <xmx:HQZvahQ02fOYUGS4P_fmZ3AYz1tlHpVtzSsSI_RVCJRH5J51FAGD9A>
    <xmx:HgZvaluKvcgiE3CwLEOLNVWrK3lc84y8jkCIryJ3nBqPwoAmdaQctb4v>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 04:55:57 -0400 (EDT)
Date: Sun, 2 Aug 2026 10:55:56 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Message-ID: <20260802085556.GB806854@robin.jannau.net>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
 <20260729-t603x-admac-v2-1-e4b2bb6ca45e@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-t603x-admac-v2-1-e4b2bb6ca45e@chaosmail.tech>

On Wed, Jul 29, 2026 at 01:46:34PM +0200, Sasha Finkelstein wrote:
> The admacs seen in M3-generation SoCs (t603x, t8122) need additional
> configuration writes and so are getting a new compatible chain.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
> index 6a200cbd7d02..5b4fd8348f99 100644
> --- a/Documentation/devicetree/bindings/dma/apple,admac.yaml
> +++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
> @@ -10,7 +10,7 @@ description: |
>    Apple's Audio DMA Controller (ADMAC) is used to fetch and store audio samples
>    on SoCs from the "Apple Silicon" family.
>  
> -  The controller has been seen with up to 24 channels. Even-numbered channels
> +  The controller has been seen with up to 32 channels. Even-numbered channels
>    are TX-only, odd-numbered are RX-only. Individual channels are coupled to
>    fixed device endpoints.
>  
> @@ -33,6 +33,12 @@ properties:
>                - apple,t8103-admac
>                - apple,t8112-admac
>            - const: apple,admac
> +      - items:
> +          - enum:
> +              - apple,t6030-admac
> +              - apple,t6031-admac
> +          - const: apple,t8122-admac
> +      - const: apple,t8122-admac
>  
>    reg:
>      maxItems: 1
> @@ -43,7 +49,7 @@ properties:
>        Clients specify a single cell with channel number.
>  
>    dma-channels:
> -    maximum: 24
> +    maximum: 32
>  
>    interrupts:
>      minItems: 4

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
