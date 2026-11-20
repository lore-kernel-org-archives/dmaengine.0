Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194570;
	b=wOhYe2b1Fy1l8sqyQ5qP7ytpWwPjiThBtUqgS1GtrOL1IMk7Qml9H4olp8oAFxWbxqj2
	 1J/OdN96qs8+qY2xsxt4eKzkr3TJYb45QfvZ9E+X2CbvoG6mB10YzJs7xA1oekYyVec82
	 zSjThIRuckxYkP8RR9IHomD6Djz1bCixFPDwJhkc2oFvHmrMLXTAaG75PtVPtQ3r+v9Fp
	 b571xSK4T6DwU5hTM2PNYYDygTpL8E+RJ7Fc5Qs9gs81CrTfzdLpqTkbcck9NlJf16Jc3
	 LHxS+LnE2TC0vfVbRlyzYSCOzrQEmQGg2Vc9wTUmxCbl60im4nT4lf5xgSWMGewOwxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194570;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=8utFTCAaOpnRDSdNopk/ScS1rYk40NreZ25aW+7v2O8=;
	b=aVwVrzoaRdzuxvvrKBQfQFX802NLCXEUOdA8UPbZoUoRVVYLLt6kO5eD3RxnTEBPRD32
	 kyW6eVL41Leg1FrKL3iGaNGJtRbX5iOGyQ4mhu+PScQqyW+48sLa/J9h6opu2tR7CE8lr
	 FQNa7MHnzorDrViZacc9j9Hv6xhZd4ZKFcolzFVHykWqOXXL4w0xrsZ3OhTsWLqcLENt0
	 oxy1q7tLnhzH3XAvRzDIOGSCzwKLx5wcom2+BFLCBWyI7FLQTBnhY7WQGk77puARuy3+7
	 nZ4ZVrBUtcC9L8K31iW+wN8daBkx0Sya3VLZK77+HBj49owJI4BXETedW9/E7CInM5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=oCCPok7w;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CF606A32C
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 17:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=oCCPok7w
DKIM2-Signature:  i=1; m=1; t=1795194567;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:u0BdtkAqG1PgAKS4HbSkrHwLx//E
   QMaGT1/PEzv6wJm06VrXcHrfeEKXQlHOZvNrQ+oc1thK/+kFNwKEar78oAdB/Cn3VEINufmYSzK
   If98dd+Dv1ZaqDzmIc2m5O+K44jW8i2XsfJng4mi+s05z1i/vwB+PUK1YNW3FYxETB6fmyvFi3Z
   j8fk7YDaWuYK8ZFLtN0gcJkl3Br3z0SQjDX03k5uEHYN8kRq0U7JPwv1FYz6IjkJplmlIi4C8nT
   8fc4PV6DPpQfslsQoSvSTtD0r2fEsJsSlEgSigZ4OEdJzJrinSzs8tRjwKf8QDhXE4DhlrzVJHj
   IL7pOZtT6BO36A==;
Message-Instance:  m=1;
 h=sha256:
   ITyGwfFXg3xQbIYvLGo6qsMX7twE/be3BW00g/6v6V4=:
   8utFTCAaOpnRDSdNopk/ScS1rYk40NreZ25aW+7v2O8=,
  sha512:
   Plljspi92ODZgOzFVBClwQ4ZCpY7+HvEbpR5StWfEFMMtLQpLATgj5rOrC9X2VaNPD5wmOlc6PqAjS49pvSP1A==:
   w8CEx7IGQ5/DXNP19z2nf6km3OwBmAOBHq+IgAZwXXGLNwSCj8koux3ldQfY4UPOg9Qfwr11Kl0Hd8WmX2zlwA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795194562; x=1795799362; i=markus.elfring@web.de;
	bh=8utFTCAaOpnRDSdNopk/ScS1rYk40NreZ25aW+7v2O8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oCCPok7w8ahlBRz/CxxLZvsK2tb6UUN8c4icPKkUgRNDT6jWL5C0z3IMKWI4l9y+
	 IYDtKGQKcZfF1oY6uHW7KQ4Yu5/4nuNz3M/PPH1MRW7S9bCmRL5YKzCYYs3Y9cyYh
	 W02w8HjLIwF5U1geSbVUeKuTC39H5lxWZnp+na9LxipcTBNlFUZiSbLvjnTZmpuBE
	 9yQW2wRmCk8lHWxWo8TlcIzdroyHWlKZyzgpxFsVZA8oEkHGKTOXCqOfB//WBgCxo
	 lPd57iiO0SFjZhrG+/l3DTATER4tfziL4Ao7S3gY0vedrEVHZbOFuO11QufYJ7ONY
	 aK8aFnO4QrpBIwX85g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MoeYH-1yJP0F0y3F-00qi1z; Fri, 20
 Nov 2026 18:09:22 +0100
Message-ID: <11ff2f72-d720-4d41-b24a-cb7432cfb50e@web.de>
Date: Fri, 20 Nov 2026 18:09:20 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
To: Frank Li <Frank.li@oss.nxp.com>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>
References: <4267a49d-89b0-4564-b22b-995de017f52b@web.de>
 <awB3YOGuJO6nZAGx@SMW015318>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <awB3YOGuJO6nZAGx@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LCTP/a/EMUMn87OBzHBY+0sJJQ2ezI8DRnS9Z+eif3f02ry6iEc
 EouvWYnfEeL/5VvXcl+wxqFghBXJeV0C90w+VMINRQ1+kfqOKlQTELu3uwdUCSpF7NznKZT
 aPgeY3ldQSbBZvolftIP4qCt3K05O081T16OiY0lAEUUpVW/f/TOPTTotnayskv6WWMN6BU
 LNGyrvJRzQYMul6haF2Cw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8VWZnnnWGoc=;BbH1kYwhOdpr6Ln2bmpQ+psfDMZ
 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
 g==

>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Fri, 20 Nov 2026 14:23:13 +0100
>=20
> Any tools issue ? your patch look strange. Why this information at body

I am trying to provide some author information.

Regards,
Markus
