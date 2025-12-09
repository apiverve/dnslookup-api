// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     DNSLookupData data = Converter.fromJsonString(jsonString);

package com.apiverve.dnslookup.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static DNSLookupData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(DNSLookupData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(DNSLookupData.class);
        writer = mapper.writerFor(DNSLookupData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// DNSLookupData.java

package com.apiverve.dnslookup.data;

import com.fasterxml.jackson.annotation.*;

public class DNSLookupData {
    private String domain;
    private Records records;

    @JsonProperty("domain")
    public String getDomain() { return domain; }
    @JsonProperty("domain")
    public void setDomain(String value) { this.domain = value; }

    @JsonProperty("records")
    public Records getRecords() { return records; }
    @JsonProperty("records")
    public void setRecords(Records value) { this.records = value; }
}

// Records.java

package com.apiverve.dnslookup.data;

import com.fasterxml.jackson.annotation.*;

public class Records {
    private String[] a;
    private String[] ns;
    private SOA soa;
    private MX[] mx;
    private String[][] txt;

    @JsonProperty("A")
    public String[] getA() { return a; }
    @JsonProperty("A")
    public void setA(String[] value) { this.a = value; }

    @JsonProperty("NS")
    public String[] getNS() { return ns; }
    @JsonProperty("NS")
    public void setNS(String[] value) { this.ns = value; }

    @JsonProperty("SOA")
    public SOA getSOA() { return soa; }
    @JsonProperty("SOA")
    public void setSOA(SOA value) { this.soa = value; }

    @JsonProperty("MX")
    public MX[] getMX() { return mx; }
    @JsonProperty("MX")
    public void setMX(MX[] value) { this.mx = value; }

    @JsonProperty("TXT")
    public String[][] getTxt() { return txt; }
    @JsonProperty("TXT")
    public void setTxt(String[][] value) { this.txt = value; }
}

// MX.java

package com.apiverve.dnslookup.data;

import com.fasterxml.jackson.annotation.*;

public class MX {
    private String exchange;
    private long priority;

    @JsonProperty("exchange")
    public String getExchange() { return exchange; }
    @JsonProperty("exchange")
    public void setExchange(String value) { this.exchange = value; }

    @JsonProperty("priority")
    public long getPriority() { return priority; }
    @JsonProperty("priority")
    public void setPriority(long value) { this.priority = value; }
}

// SOA.java

package com.apiverve.dnslookup.data;

import com.fasterxml.jackson.annotation.*;

public class SOA {
    private String nsname;
    private String hostmaster;
    private long serial;
    private long refresh;
    private long retry;
    private long expire;
    private long minttl;

    @JsonProperty("nsname")
    public String getNsname() { return nsname; }
    @JsonProperty("nsname")
    public void setNsname(String value) { this.nsname = value; }

    @JsonProperty("hostmaster")
    public String getHostmaster() { return hostmaster; }
    @JsonProperty("hostmaster")
    public void setHostmaster(String value) { this.hostmaster = value; }

    @JsonProperty("serial")
    public long getSerial() { return serial; }
    @JsonProperty("serial")
    public void setSerial(long value) { this.serial = value; }

    @JsonProperty("refresh")
    public long getRefresh() { return refresh; }
    @JsonProperty("refresh")
    public void setRefresh(long value) { this.refresh = value; }

    @JsonProperty("retry")
    public long getRetry() { return retry; }
    @JsonProperty("retry")
    public void setRetry(long value) { this.retry = value; }

    @JsonProperty("expire")
    public long getExpire() { return expire; }
    @JsonProperty("expire")
    public void setExpire(long value) { this.expire = value; }

    @JsonProperty("minttl")
    public long getMinttl() { return minttl; }
    @JsonProperty("minttl")
    public void setMinttl(long value) { this.minttl = value; }
}