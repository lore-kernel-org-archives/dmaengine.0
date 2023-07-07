Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A113EB64D9
	for <dmaengine@archiver.kernel.org>; Fri,  7 Jul 2023 05:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjGGFjT (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 7 Jul 2023 01:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjGGFjS (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 7 Jul 2023 01:39:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DFC1BE1;
        Thu,  6 Jul 2023 22:39:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F79E6173C;
        Fri,  7 Jul 2023 05:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757CFC433C7;
        Fri,  7 Jul 2023 05:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688708357;
        bh=xBPm47qwm/R3ZNc2QjZomvgZ/cgbmFd7MZsL2fkoulU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NNUVNKXmdUUfk4RlxPpaO5Jq0p6oZSwsjyZtEei/1IN3yJrvVarowwN/joh8OQ4ax
         KwneTnBsmHUIujC+5osd497Vrbo4/f/SP+eZEfrbsnZlIVJzLpJXkgXQDRP71sHpDm
         NpKewcNRCMXpbJX83u6Pu0X62M73eCV9HwTDvbrzPnejcZaska0qdHdHpWyRTiWdUf
         d/WQlGTIadfHJbAvOGW4KJMoMm7ehqNisu9F6qTHJ00h8laDPsFVOeKAKqmtEV3Bs4
         CipOHL8+L+8pj8GksRt6sts3Solpu67m9MYqAfNYn10QGreL0VXea46/7zACOqqHR5
         VtRnY8AYqs9OA==
Date:   Fri, 7 Jul 2023 11:09:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Frank Li <Frank.Li@nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, peng.fan@nxp.com, joy.zou@nxp.com,
        shenwei.wang@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH v9 02/13] dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL
 in fsl-edma-common.c
Message-ID: <ZKelAeBE/gDI/IAs@matsya>
References: <20230620201221.2580428-1-Frank.Li@nxp.com>
 <20230620201221.2580428-3-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620201221.2580428-3-Frank.Li@nxp.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 20-06-23, 16:12, Frank Li wrote:
> Exported functions in fsl-edma-common.c are only used within
> fsl-edma.c and mcf-edma.c. Global export is unnecessary.
> 
> This commit removes all EXPORT_SYMBOL_GPL in fsl-edma-common.c,
> and renames fsl-edma.c and mcf-edma.c to maintain the same
> final module names as before, thereby simplifying the codebase.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---

>  
> -MODULE_LICENSE("GPL v2");

Why drop this?

-- 
~Vinod
