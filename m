Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91187C7619A
	for <dmaengine@archiver.kernel.org>; Wed, 12 Apr 2023 17:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjDLRru (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 12 Apr 2023 13:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjDLRrs (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 12 Apr 2023 13:47:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579ED30E0;
        Wed, 12 Apr 2023 10:47:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9A7362BEB;
        Wed, 12 Apr 2023 17:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE458C433EF;
        Wed, 12 Apr 2023 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681321667;
        bh=3+orMSU2PhawA2Qj4HUkuS/UPJMHeLNcy/kbBJSLcUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qjZfuKX3OArcD5eobeqPLMRILgWo7/Ya5IPWfmkeM2b7DnOcyoT3YWSE3b0QTiukR
         BDd2y8WoyPhHoBWSOEg1YX3aOVnzAIfqbw4ZBuHOqXPBqEoaTfI6RjOJz1BtYZf+XL
         b7AYilTpZO5Ugt83hTFhMJxDFfWGLKMfSDuvC6QHnKoW16IRwsLhX5P8vKevw9ksz3
         NI7uw2DCRkE58WMoPBFlFYSvIj8LO19mEx4UEelDUgVVISAhjTqULjWKwlk1toyw/7
         N96UrqUD5vmTdTEZLdS27if61hZY4/z0dZyViFTH3pppCYou2n011ADUjNEm4fqvFe
         IqFFeh/+xZhDQ==
Date:   Wed, 12 Apr 2023 23:17:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     ludovic.desroches@microchip.com, tudor.ambarus@linaro.org,
        nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] dmaengine: at_xdmac: fixes for suspend/resume
Message-ID: <ZDbuvzFIAlIghVpH@matsya>
References: <20230214151827.1050280-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214151827.1050280-1-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 14-02-23, 17:18, Claudiu Beznea wrote:
> Hi,
> 
> Series adds fixes identified on suspend/resume of at_xdmac driver
> (patches 1/7-5/7).

Applied, thanks

-- 
~Vinod
