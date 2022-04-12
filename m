Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFF5C43217
	for <dmaengine@archiver.kernel.org>; Tue, 12 Apr 2022 23:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiDLX0d (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 12 Apr 2022 19:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiDLX0M (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 12 Apr 2022 19:26:12 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263EC289BC
        for <dmaengine@vger.kernel.org>; Tue, 12 Apr 2022 15:41:54 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id a19so247582oie.7
        for <dmaengine@vger.kernel.org>; Tue, 12 Apr 2022 15:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UxsCoDp31aiBImIkqt24q8Po1hYiUkBUonDFR5Ofntw=;
        b=bZwl33ihse6GJsvXWKqeF/IvrtS5uft25XvaEmueM5II7dwdtvYViIen+7Wp1P7mz4
         VKgUHWj8EIKf82qgI43YteAK0OkCiwKFfOgOMB1Q2JbRCIPw2BQcyLtCBRSkUb5h67yt
         oeFt0MzLGTD04LYu31FTgHr0p3sxhvuYqBr3HHxaPF7ebxmSskQlF3g5SHcJjviq+NhW
         xtat1qBFPUPJKwzEa2XQWuO24VxhE6IF/j2YYiKP/yRfH14bMFcJBFB3QlenXLMzYoap
         XqE32894ZyK+6LRmumbtoilW1fK5oZZZkEkyN1cQSU4E787hevhLMrHPMv/hP0nZ6kE1
         Jl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UxsCoDp31aiBImIkqt24q8Po1hYiUkBUonDFR5Ofntw=;
        b=XGSSVR4n+oWJ4TbQG/aRQr6wEs/d5CnVhPZP9MgcGTvUc6rc1pVTGZZKT0VUMFyVex
         IvVwLyTjTHbf0SKWqHb+TdFSwoRP2sOIfciqcGCOen4kiYGHqFsCQ7BSGtKxUlmOhBCH
         pTAxi7RV8m6jeE0PI72ghHbVTHJTnahFeMwrBDAKcXcl82dH1hbMz8eln80wiGaKwENU
         QPVCZyajFsEomX7h9Q73Jc1R9Es8qfaE19oh00ujB4+ThamtB/r7u1y/7CeWCHn90X84
         VXwoFMSvn8BSBXkryaBGmJDkqmQKwuPeW+aQu+jY13fNKVXvJQ8VFiQLot+G2HnqIpCI
         qdTQ==
X-Gm-Message-State: AOAM531GQAqciiUgBHLel7QsZg5zJxj7ROANAuUS/fRWGLoNcCE/jAaj
        PRaF57xWL+ppyGNhJy7mjtAI7SU8Uv0oEkYv
X-Google-Smtp-Source: ABdhPJxQXi0kdMcvyM1GWhqO3O9Kb0wbW7X9aOWlbTvYSzQW8CKf+NDBl31lTel+Bm4PQUGUuT9DAg==
X-Received: by 2002:a05:6808:114d:b0:2f7:59fd:2f18 with SMTP id u13-20020a056808114d00b002f759fd2f18mr2672185oiu.113.1649798910952;
        Tue, 12 Apr 2022 14:28:30 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w133-20020acadf8b000000b002ef9fa2ba84sm13078432oig.12.2022.04.12.14.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:28:30 -0700 (PDT)
Date:   Tue, 12 Apr 2022 14:30:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: qcom: gpi: set chain and link flag for
 duplex
Message-ID: <YlXvhAJHl2JKy2+6@ripper>
References: <20220406132508.1029348-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406132508.1029348-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Wed 06 Apr 06:25 PDT 2022, Vinod Koul wrote:

> Newer platforms seem to have strict requirement for TRE flags which
> causes transaction to timeout. This was resolved to missing chain and
> link flag for duplex spi transaction.
> 
> So add these two flags.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/dma/qcom/gpi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 94f3648f7483..3429ceccd13b 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1754,10 +1754,14 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
>  		tre->dword[2] = u32_encode_bits(spi->rx_len, TRE_RX_LEN);
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
> -		if (spi->cmd == SPI_RX)
> +		if (spi->cmd == SPI_RX) {
>  			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOB);
> -		else
> +		} else if (spi->cmd == SPI_TX) {
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
> +		} else { /* SPI_DUPLEX */
>  			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
> +		}
>  	}
>  
>  	/* create the dma tre */
> -- 
> 2.34.1
> 
